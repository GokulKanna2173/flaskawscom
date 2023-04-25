from flask import *
import hashlib, os
from werkzeug.utils import secure_filename
# from flask import Flask, render_template, request
import pickle
import pymysql
# from flask_sqlalchemy import SQLAlchemy
import pandas as pd
import socket
import datetime
#from date import date

app = Flask(__name__)
# app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://admin:awsadmin@flaskdb.clrnsymfz2e0.us-east-1.rds.amazonaws.com/flaskaws'
# app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
# db = SQLAlchemy(app)

global prdt_name
global prdt_price
global productData1
#global totalPrice
# global loggedIn
# global firstName
# global noOfItems
global prdt_img

def dbConnection():
    try:
        connection = pymysql.connect(host="ecom2.cmw2c9kd6mic.us-east-2.rds.amazonaws.com", user="admin", password="awsadmin", database="29polarity",charset='utf8', port=3307)
        return connection
    except:
        print("Something went wrong in database Connection")


def dbClose():
    try:
        dbConnection().close()
    except:
        print("Something went wrong in Close DB Connection")
        

con = dbConnection()
cursor = con.cursor()

def recommend(id):
    import pandas as pd
    import numpy as np
    conn = dbConnection()
    cur = conn.cursor()
    sql="SELECT uid,pid,purchase_count from recommend"
    cur.execute(sql)
    table_rows = cur.fetchall()
    df = pd.DataFrame(table_rows,columns=['uid','pid','purchascount'])
    #df.to_csv("Reco.csv")
    print()
    print("printign np.unique(df['pid']")
    print(np.unique(df['pid']))
    a=len(np.unique(df['pid']))

    print()
    print("printing a")
    print(a)
    print()
    df = df.astype({"uid": int,"pid": int,"purchascount": int })
    ratings_utility_matrix=df.pivot_table(values='purchascount', index='uid', columns='pid', fill_value=0)
    X = ratings_utility_matrix.T
    print()
    print(X)
    print()
    import sklearn
    from sklearn.decomposition import TruncatedSVD
    SVD = TruncatedSVD(n_components=int(2))
    decomposed_matrix = SVD.fit_transform(X)
    correlation_matrix = np.corrcoef(decomposed_matrix)
    i = id
    product_names = list(X.index)
    product_ID = product_names.index(i)
    correlation_product_ID = correlation_matrix[product_ID]
    Recommend = list(X.index[correlation_product_ID > 0.70])
    Recommend.remove(i) 
    return Recommend[0:5]


con=dbConnection()
cursor=con.cursor()

UPLOAD_FOLDER = 'static/uploads'
ALLOWED_EXTENSIONS = set(['jpeg', 'jpg', 'png', 'gif'])
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.secret_key = 'random string'

##########################################################################################################
#                                           Register
##########################################################################################################
@app.route("/register", methods = ['GET', 'POST'])
def register():
    if request.method == 'POST':
        #Parse form data    
        # print("hii register")
        email = request.form['email']
        password = request.form['password']
        username = request.form['username']
        add = request.form['add']
        postc = request.form['postc']
        mob = request.form['mob']
        productId = 0
        print(password)
        print(email)
        print(username)
        print(add)
        print(postc)
        print(mob)
        print(productId)
        try: 
            con = dbConnection()
            cursor = con.cursor()
            sql1 = "INSERT INTO users (username, email, pass) VALUES (%s, %s, %s)"
            val1 = (username, email, password)
            cursor.execute(sql1, val1)
            print("query 1 submitted")
            sql2 = "INSERT INTO address (username, email, address, postcode, mobile) VALUES (%s, %s, %s, %s, %s)"
            val2 = (username, email, add, str(postc), str(mob))
            cursor.execute(sql2, val2)
            print("query 2 submitted")
            # sql3 = "INSERT INTO kart1 (username, productId) VALUES (%s, %s)"
            # val3 = (username, int(productId))
            # cursor.execute(sql3, val3)
            # print("query 3 submitted")
            con.commit()
        except:
            con.rollback()
            msg = "Error occured"
            return render_template("login.html", error=msg)
        finally:
            dbClose()
        return render_template("login.html")
    return render_template("login.html")
##########################################################################################################
#                                               Login
##########################################################################################################
@app.route("/", methods = ['POST', 'GET'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password'] 

        # print(email)
        # print(password)
        con = dbConnection()
        cursor = con.cursor()
        result_count = cursor.execute('SELECT * FROM users WHERE email = %s AND pass = %s', (email, password))
        result = cursor.fetchone()
        print("result")
        
        print(result)
        if result_count>0:
            print("len of result")
            session['uname'] = result[1]
            session['userid'] = result[0]
            return redirect(url_for('root'))
        else:
            return render_template('login.html')
    return render_template('login.html')
##########################################################################################################
#                                       Product Description
##########################################################################################################
@app.route("/single", methods = ['POST', 'GET'])
def productDescription():
    global prdt_name
    global prdt_price
    global productData1
    global loggedIn
    global firstName
    global noOfItems
    global prdt_img

    username=session.get('uname')
    productId = request.args.get('productId')
    
    print("######### productId ####")
    print(productId)
    con = dbConnection()
    cursor = con.cursor()

    cursor.execute('SELECT uname, comments FROM user_analysis where product_id = %s',(productId))
    cmnt = cursor.fetchall()
    print("### cmnt ####")
    print(cmnt)
    ################### fetching comments and username from database #############################
    unm=[]
    cm=[]
    for i in cmnt:
        a = i[0]
        unm.append(a)
        b = i[1]
        cm.append(b)
        # print("### a,b ####")
        # print(a,b)
        # break
    cmt = zip(unm,cm)  

    cursor.execute('SELECT name, price, description, image FROM product WHERE productId = ' + productId)
    productData = cursor.fetchone()
    productData = list(productData)
    # print("#### productData #####")
    # print(productData)

    prdt_name = productData[0]
    prdt_price = productData[1]
    prdt_disc = productData[2].split(',')
    productData1 = []
    for i in prdt_disc:
        prdt_disc1 = i.replace("\r\n","")
        productData1.append(prdt_disc1)
    print("#### prdt_disc #####")
    print(productData1)
    prdt_img = productData[3]


    cursor.execute('SELECT categoryId FROM product WHERE productId = ' + productId)
    cat_dat = cursor.fetchone()
    con.close()

    ############################ recommend ####################################
    usrid = session.get("userid")
    usrid2 = session['userid']
    print()
    print("printing user id")
    print(usrid)
    print(usrid2)
    print()

    conn = dbConnection()
    curso = conn.cursor()
    sql = "SELECT pid from recommend where uid=%s ORDER BY uid DESC LIMIT 1"
    val = (usrid)
    curso.execute(sql,val)
    res = curso.fetchone()
    res = list(res)
    result = res[0]
    
    rec_lst = recommend(int(result))
    print()
    print("printig rec_lst")
    print(rec_lst)

    prdct_id = []
    prdct_name = []
    prdct_price = []
    prdct_img = []

    for i in rec_lst:
        sql = "SELECT productId, name, price, image from product where productId=%s"
        val = (i)
        curso.execute(sql,val)
        res = curso.fetchall()
        result = list(res)
        print("printing result")
        print(result)
        for i in result:
            a=i[0]
            prdct_id.append(a)
            b = i[1]
            prdct_name.append(b)
            c = i[2]
            prdct_price.append(c)
            d = i[3]
            prdct_img.append(d)
    
    flst = zip(prdct_id, prdct_name, prdct_price, prdct_img)


    return render_template('single.html',cmt=cmt,flst=flst,  firstName=username, prdt_name=prdt_name, prdt_price=prdt_price,productId=productId, productData1=productData1, prdt_img=prdt_img )
##########################################################################################################
#                                               about
##########################################################################################################
@app.route("/about", methods = ['POST', 'GET'])
def about():
    username=session.get('uname')
    return render_template('about.html',firstName=username)
##########################################################################################################
#                                               Report
##########################################################################################################
@app.route("/report", methods = ['POST', 'GET'])
def report():
    username=session.get('uname')
    prd_name = request.args.get('prd_name')
    prd_name=list(prd_name.split('?'))
    prd_nm=prd_name[0]
    cmnt=prd_name[1]
    rprt=prd_name[2]

    # print("#### prd_name,cmnt,rprt ####")
    # print(prd_nm)
    # print(cmnt)
    # print(rprt)
    con = dbConnection()
    cursor = con.cursor()
    res_cont = cursor.execute('SELECT report FROM user_analysis WHERE product_name = %s and comments = %s', (prd_nm,cmnt))
    reprt = cursor.fetchone()
    # con.close()
    print("## reprt #")
    print(int(reprt[0]))
    report_num=int(reprt[0])
    report_num= report_num + 1

    sql1 = "UPDATE user_analysis SET report=%s WHERE product_name = %s and uname = %s"
    val1 = (str(report_num),prd_nm,username)
    cursor.execute(sql1, val1)
    con.commit()
    return redirect(url_for('root'))



    # return render_template('single.html',  firstName=username, prdt_name=prdt_name, prdt_price=prdt_price, productData1=productData1, prdt_img=prdt_img )
##########################################################################################################
#                                               contact
##########################################################################################################
@app.route("/contact", methods = ['POST', 'GET'])
def contact():
    username=session.get('uname')
    return render_template('contact.html',firstName=username)

##########################################################################################################
#                                               contact
##########################################################################################################
@app.route("/logout", methods = ['POST', 'GET'])
def logout():
    # username=session.get('uname')
    session.pop('uname',None)
    return redirect(url_for('login'))
#######################################     ADD TO CART      #############################################
@app.route("/addTocart/<string:id>", methods = ['POST', 'GET'])
def addTocart(id):
    print("********************************************")
    if request.method == 'POST':
        quantity = request.form['quantity']
        #price = request.form['price']
        print(quantity)
       # noOfItems = logindetails()
       # print(noOfItems)
        print('hiiiiiiiiiiiiiiiiii')
        con = dbConnection()
        cursor = con.cursor()
        uid = session['userid']
        uname = session['uname']
        sql = cursor.execute( "INSERT INTO kart (userId, username, productId, quantity) VALUES(%s,%s,%s,%s)", [uid,uname,id,quantity] )
        #print(sql)
        #total = 
        con.commit()
        return redirect(url_for('root'))
    #return render_template('index.html',noOfItems=noOfItems)
    
    
    

###################################     REMOVE FROM CART    ############################################
@app.route("/removefromCart/<string:id>", methods = ['POST', 'GET'])
def removefromCart(id):
    print("***************delete************************")
    pid = id
    uid = session['userid']
    print(pid)
    con = dbConnection()
    cursor = con.cursor()
    cursor.execute("DELETE FROM kart WHERE userId=%s AND productId=%s",[str(uid), str(pid)])
    con.commit()
    return redirect(url_for('root'))
    #return render_template('index.html')
    
#     return render_template('kart1.html',  firstName=username, categoryData=categoryData, product_lst_m=result11, product_lst_w=result2, product_lst_b=result3, product_lst_f=result4)

##########################################################################################################
#                                               Single page
##########################################################################################################
# @app.route("/kart", methods = ['POST', 'GET'])
# def kart():
#     global prdt_name
#     global prdt_price
#     global productData1
#     global loggedIn
#     global firstName
#     global noOfItems
#     global prdt_img

#     if request.method == 'POST':
#         productId = request.form['productId']
#         itm_name = request.form['item_name']
#         amnt = request.form['amount']
#         print("#### itm_name,amnt ########")
#         print(productId,itm_name,amnt)

#         username=session.get('uname')
#         print(username)

#         con = dbConnection()
#         cursor = con.cursor()
#         result_count = cursor.execute("SELECT name, price, description, image from product where name=%s", (itm_name))
#         result = cursor.fetchone()
#         result = list(result)
#         print(result)
#         print()

#         prd_name = result[0]
#         Price = result[1]
#         description = result[2]
#         img = result[3]

#         uname = session.get("uname")
#         result_count = cursor.execute("SELECT email, address, postcode, mobile from address where username=%s", (uname))
#         result2 = cursor.fetchone()
#         result2 = list(result2)
#         email = result2[0]
#         address = result2[1]
#         postcode = result2[2]
#         mobile = result2[3]

#         print()
#         print(result2)

#         sql1 = "INSERT INTO kart1 (username, email, address,postcode,mobile,prd_name,Price,description,img) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"
#         val1 = (uname, email, address,postcode,mobile,prd_name,Price,description,img)
#         cursor.execute(sql1, val1)
#         con.commit()
#         print("query submitted")

#         return render_template('kart.html',  firstName=username,description=description,Price=Price,prd_name=prd_name,img=img)
#     return render_template('single.html')

##########################################################################################################
#                                       Home page
##########################################################################################################
@app.route("/root")
def root():
    #global totalPrice
    if 'uname' in session:
        print(" hii root")
        username=session.get('uname')
        con = dbConnection()
        cursor = con.cursor()
        ##########################    view products to user index root pg after login      ###########################################
        # MENS Products
        result_count=cursor.execute("SELECT * FROM product WHERE categoryId = 1")
        result11 = cursor.fetchall()
        print()
        print("result11")
        
        print()
        # WOMENS Products
        result_count1=cursor.execute("SELECT * FROM product WHERE categoryId = 2")
        result2 = cursor.fetchall()
        # bags Products
        result_count2=cursor.execute("SELECT * FROM product WHERE categoryId = 3")
        result3 = cursor.fetchall()
        # Footwear Products
        result_count3=cursor.execute("SELECT * FROM product WHERE categoryId = 4")
        result4 = cursor.fetchall()
        
        #####################################################################3
        # username = session.get("user")

        # cursor.execute("SELECT productId, name, price, description, image, stock FROM product")
        # result1 = cursor.fetchone()
        # cursor.execute("SELECT categoryId, name FROM categories")
        # categoryData = cursor.fetchone()
        cursor.execute("SELECT productId, name, price, description, image, stock FROM product")
        result1 = cursor.fetchone()
        cursor.execute("SELECT categoryId, name FROM categories")
        categoryData = cursor.fetchone()
        ################  CArt button modal index pg   #######
        uid = session['userid']
        result = cursor.execute("SELECT product.productId,product.name,product.price,product.image,kart.quantity,(kart.quantity*product.price) as ProductPrice FROM product JOIN kart ON product.productid=kart.productid WHERE userId=" +str(uid))
        prod_val = cursor.fetchall()
        totalPrice = 0
        for row in prod_val:
            totalPrice += int(row[5])
        print(totalPrice)
        session['totalPrice'] = totalPrice
       # session['userid'] = result[0]
        
        #################
        con.commit()   

    return render_template('index.html',totalPrice=totalPrice, firstName=username, categoryData=categoryData, product_lst_m=result11, product_lst_w=result2, product_lst_b=result3, product_lst_f=result4, prod_val=prod_val)

##########################################################################################################
#                                       Home page
##########################################################################################################
@app.route("/ordered", methods=["GET","POST"])
def ordered():
    if 'uname' in session and request.method=="POST":
        print(" hii root")
        username=session.get('uname')
        con = dbConnection()
        cursor = con.cursor()
        # username = session.get("user")

        # cursor.execute("SELECT productId, name, price, description, image, stock FROM product")
        # result1 = cursor.fetchone()
        # cursor.execute("SELECT categoryId, name FROM categories")
        # categoryData = cursor.fetchone()
        cursor.execute("SELECT productId, name, price, description, image, stock FROM product")
        result1 = cursor.fetchone()
        cursor.execute("SELECT categoryId, name FROM categories")
        categoryData = cursor.fetchone()
        con.commit()   

        flash("Your order has been placed! Thank you for shopping!","order")

    return render_template('index.html',  firstName=username, categoryData=categoryData)
##########################################################################################################
#                                       Review part
##########################################################################################################
@app.route("/review", methods = ['POST', 'GET'])
def review():
    if 'uname' in session and request.method == 'POST':
        print(" hii root")
        global prdt_name
        global prdt_price
        global productData1

        username=session.get('uname')
        txt = request.form['Message']
        prduct_nm = request.form['prduct_nm']
        con = dbConnection()
        cursor = con.cursor()
        sql =" INSERT INTO review(review,uname) VALUES(%s,%s)" 
        val = (txt,username)
        review_result = cursor.execute(sql,val)
        print("Query submitted successfully..........")
        con.commit()
        ####################### Fetching Ip adress and report count #####################
        hostname=socket.gethostname()   
        IPAddr=socket.gethostbyname(hostname)   
        # print("Your Computer Name is:"+hostname)   
        # print("Your Computer IP Address is:"+IPAddr)
        ####################### Buy or not #####################
        con = dbConnection()
        cursor = con.cursor()
        result_count = cursor.execute('SELECT username FROM kart1 WHERE username = %s and prd_name = %s', (username,prduct_nm))
        res = cursor.fetchone()
        # print("result")
        # print(res)
        if result_count==0:
            buy_not="0"
        else:
            buy_not="1"
        rep_count="0"
        ####################### Prodct name #####################
        con = dbConnection()
        cursor = con.cursor()
        result_count = cursor.execute('SELECT productId FROM product WHERE name = %s', (prduct_nm))
        prdt_id = cursor.fetchone()
        print("## Prodct name ###")
        print(list(prdt_id)[0])

        cursor.execute('SELECT name, price, description, image FROM product WHERE productId = ' + list(prdt_id)[0])
        productData = cursor.fetchone()
        productData = list(productData)
        # print("#### productData #####")
        # print(productData)

        prdt_name = productData[0]
        prdt_price = productData[1]
        prdt_disc = productData[2].split(',')
        productData1 = []
        for i in prdt_disc:
            prdt_disc1 = i.replace("\r\n","")
            productData1.append(prdt_disc1)
        print("#### prdt_disc #####")
        print(productData1)
        prdt_img = productData[3]

        ####################### Fetching time and date #####################
        now = datetime.now()
        dt_string = now.strftime("%H:%M:%S")
        # print("date and time =", dt_string)

        con = dbConnection()
        cursor = con.cursor()

        sql2 = "INSERT INTO user_analysis (product_id,product_name, uname, comments, ipadd, time_stmp, buy1_not0,report) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
        val2 = (prdt_id,str(prduct_nm), str(username), str(txt), str(IPAddr), str(dt_string), str(buy_not),str(rep_count))
        cursor.execute(sql2, val2)
        con.commit()   
        print("All data feed to database")

    return render_template('single.html',  firstName=username, txt=txt, prdt_name=prduct_nm, prdt_price=prdt_price, productData1=productData1, prdt_img=prdt_img )

##########################################################################################################
#                                      Admin part
##########################################################################################################
@app.route("/adregister", methods = ['GET', 'POST'])
def adregister():
    if request.method == 'POST':
        #Parse form data    
        # print("hii register")
        email = request.form['email']
        password = request.form['password']
        username = request.form['username']
        print(password)
        print(email)
        print(username)
        try: 
            con = dbConnection()
            cursor = con.cursor()
            sql1 = "INSERT INTO admin (username, email, pass) VALUES (%s, %s, %s)"
            val1 = (username, email, password)
            cursor.execute(sql1, val1)
            print("query 1 submitted")
            con.commit()
        except:
            con.rollback()
            msg = "Error occured"
            return render_template("admin.html", error=msg)
        finally:
            dbClose()
        return render_template("admin.html")
    return render_template("admin.html")

@app.route("/adlogin", methods = ['POST', 'GET'])
def adlogin():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password'] 

        # print(email)
        # print(password)
        con = dbConnection()
        cursor = con.cursor()
        result_count = cursor.execute('SELECT * FROM admin WHERE email = %s AND pass = %s', (email, password))
        result = cursor.fetchone()
        print("result")
        print(result)
        if result_count>0:
            print("len of result")
            session['uname'] = result[1]
            session['userid'] = result[0]
            return redirect(url_for('adhome'))
        else:
            return render_template('admin.html')
    return render_template('admin.html')

@app.route("/adhome")
def adhome():
    if 'uname' in session:
        global final_data
        print(" hii root")
        username=session.get('uname')
        con = dbConnection()
        cursor = con.cursor()
        ##########################    view products to admin home      ###########################################
        # MENS Products
        result_count=cursor.execute("SELECT * FROM product WHERE categoryId = 1")
        result1 = cursor.fetchall()
        # WOMENS Products
        result_count1=cursor.execute("SELECT * FROM product WHERE categoryId = 2")
        result2 = cursor.fetchall()
        # bags Products
        result_count2=cursor.execute("SELECT * FROM product WHERE categoryId = 3")
        result3 = cursor.fetchall()
        # Footwear Products
        result_count3=cursor.execute("SELECT * FROM product WHERE categoryId = 4")
        result4 = cursor.fetchall()
        return render_template('adhome.html',product_lst_m=result1, product_lst_w=result2,product_lst_b=result3,product_lst_f=result4)
        
        
        # result_count1=cursor.execute("SELECT * FROM product WHERE categoryId = 2")
        # result2 = cursor.fetchall()
        
        # if result_count1>0:
        #     return render_template('adhome.html', product_lst_w=result2)
        
        
        
        ##########################################################################################################
        cursor.execute("SELECT * FROM user_analysis")
        result1 = cursor.fetchall()
        print("### result1 ###")
        print(result1)
        con.commit()   
        user_data = list(result1)

        sr_no=[]
        prdct_id=[]
        prdct_name=[]
        uname=[]
        cmnts=[]
        ipad=[]
        real_fk=[]
        tim_stmp=[]
        by_not=[]
        rprt_count=[]
        for i in user_data:
            a=i[0]
            print("### printing a ###")
            print(a)
            sr_no.append(a)

            b=i[1]
            prdct_id.append(b)

            c=i[2]
            prdct_name.append(c)

            d=i[3]
            uname.append(d)

            e=i[4]
            cmnts.append(e)

            f=i[5]
            ipad.append(f)

            g=i[6]
            real_fk.append(g)

            h=i[7]
            tim_stmp.append(h)

            l=i[8]
            by_not.append(l)

            j=i[9]
            rprt_count.append(j)
        
        final_data=zip(sr_no,prdct_id,prdct_name,uname,cmnts,ipad,real_fk,tim_stmp,by_not,rprt_count)
        return render_template('adhome.html',  firstName=username, final_data=final_data)
    return render_template('adhome.html')
###########################################      ADD PRODUCT         ####################################################

@app.route('/addproduct', methods=['POST', 'GET'])
def addproduct():
    if request.method == "POST":
        pname = request.form['pname']
        price = request.form['price']
        description = request.form['desc']
        image = request.files['file']
        stock = request.form['stock']
        category = request.form['category']
        offer = request.form['offer']
        print(pname)
        filename_secure = secure_filename(image.filename)
        image.save(os.path.join(app.config['UPLOAD_FOLDER'],filename_secure))
        filenamepath = os.path.join(app.config['UPLOAD_FOLDER'],filename_secure)
        ff = filename_secure
        # try:            
        con = dbConnection()
        print("Connection done.......................")
        cursor = con.cursor()
        sql = "INSERT INTO product (name,price,description,image,stock,categoryId,offers) VALUES(%s,%s,%s,%s,%s,%s,%s) "
        print(sql)
        val =(pname,price,description,ff,stock,category,offer)
        cursor.execute(sql,val)        
        print("query submitted.........")
        con.commit()
        msg = "Product Added Successfully................."
        return render_template("addproduct.html", msg=msg)
                
    return render_template('addproduct.html')

###########################################     Graph PRODUCT REPORT      ####################################################
@app.route('/productreport', methods=['POST', 'GET'])
def productreport():
    con = dbConnection()
    cur = con.cursor()
    cur.execute("SELECT sum(stock)as itemstock ,categories.name FROM product JOIN categories on product.categoryId =categories.categoryId GROUP BY name")
    result1 = cur.fetchall()
    con.commit()
    return render_template("productstock.html",  itemstock=result1)           
###################################################################################################################
@app.route('/checkout', methods=['POST', 'GET'])
def checkout():
    totalPrice1 = session['totalPrice']
    return render_template("payment.html",totalPrice1=totalPrice1)
###########################################      Payment REPORT      ####################################################
@app.route('/payment', methods=['POST', 'GET'])
def payment():
    uid = session['userid']
    Current_Date = datetime.date.today()
    print ('Current Date: ' + str(Current_Date))  
    totalPrice1 = session['totalPrice']
    print("totalPrice1="+ str(totalPrice1))
    print("************************")
    
    if request.method == 'POST':
        number = request.form['number']
        name = request.form['name']
        #totalAmount = request.form['amount']
        exp = request.form['exp']
        print("Card Number=" +number+"my name")
        print("Cardholder's Name=" +name)
        #print(totalAmount)         
        print("expiryDate=" +exp)
        con = dbConnection()
        cursor = con.cursor()
       
        cursor.execute("SELECT kart.username, kart.quantity,product.categoryId,product.productId FROM kart JOIN product ON product.productId=kart.productId WHERE userId= "+str(uid))
        kartProduct = cursor.fetchall()    
        
        for i in kartProduct:
            Quantity = i[1]
            categoryId = i[2] 
            productId = i[3]  
            query1 = "INSERT INTO user_prod_details(userId,date,category,quantity) VALUES (%s,%s,%s,%s)"
            val = (uid,Current_Date,categoryId,Quantity)          
            print(val)     
  
            cursor.execute(query1,val)          
            print("query submitted.........")
            con.commit()
            query2 = "UPDATE product SET stock = stock - %s Where productId=%s"
            val2   = (Quantity,productId)
            cursor.execute(query2,val2) 

            query3 = "INSERT INTO recommend(uid,pid,purchase_count) VALUES (%s,%s,%s)"
            val3   = (uid,productId,Quantity)
            cursor.execute(query3,val3) 
            con.commit()
           
        cursor.execute("DELETE FROM kart WHERE userId=%s",[str(uid)])       
        con.commit()
        msg = "Pyament Sccessfull!......."
        return redirect(url_for('root'))
    return render_template('index.html')

if __name__=='__main__':
    app.run(debug=True)
    # app.run('0.0.0.0')