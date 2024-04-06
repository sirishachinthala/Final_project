from flask import *
from random import *
import requests
import stripe
import json
from flask_mail import *
application=Flask(__name__)
application.secret_key="movie-project"
from flask_bcrypt import Bcrypt
import mysql.connector
#Flask mail configuration
application.config['MAIL_SERVER']='smtp.gmail.com'
application.config['MAIL_PORT']=465
application.config['MAIL_USERNAME'] = 'siribtech507@gmail.com'
application.config['MAIL_PASSWORD'] = 'gwqb pzpw tlam wevy'
application.config['MAIL_USE_TLS'] = False
application.config['MAIL_USE_SSL'] = True
mail = Mail(application)
stripe.api_key = "sk_test_51NH9ERSHahk6wnPYDNqqG9F0JmsxcTqbwkswSOVEDx2YzCk3gGzZkcCkanDDyt3wu9UvVd14hCQywqZFI2TzfMX000ZN4Te1t2"
#name="";email="";phone="";hashedpassword=""
conn=mysql.connector.connect(host='localhost',port='3306',
                   user='root',password='S#Rish@507',db='Movie')
conn.autocommit=True
bcrypt=Bcrypt()
@application.route("/home/",methods=['POST'])
def home():
    global  gname
    email=request.form['usrmail']
    password=request.form['usrpswd']
    cursor=conn.cursor(buffered=True)
    cursor.execute("Select Email,Password,Name from userdata ")
    data=cursor.fetchall()
    for row in data:
        if email == row[0]:
            if bcrypt.check_password_hash(row[1],password):
                gname =row[2]
                return  redirect(url_for('index'))
            else :
                flash("Incorrect password ",'message')
                return redirect(url_for("login"))

    flash("User not found..! Try to  create account by clicking on signup ")
    return redirect(url_for("login"))
@application.route('/resend')
def sendmessage():
    global emailotp
    emailotp = randint(000000,999999)
    msg = Message('OTP VERIFY', sender='#sendermail', recipients=[email])
    msg.body = (f"The otp is {emailotp}")
    mail.send(msg)

@application.route("/signup/",methods=['POST'])
def signup():
    global name,email,phone,hashedpassword
    name=request.form['usrname']
    email=request.form['usrmail']
    phone=request.form['usrphone']
    password=request.form['usrpswd1']
    confirmpswd=request.form['usrpswd2']
    if (password==confirmpswd):
        hashedpassword= bcrypt.generate_password_hash(password=password)
        sendmessage()
        return render_template("otp.html",email1=email[0:3]+'xxx'+'@gmail.com',phone1='xxx'+phone[6:])
    else :
        flash("Passwords doesn't match try signup again")
        return redirect(url_for('login'))

@application.route("/forgotpass/")
def forgotpass():
    return render_template("forgotpass.html")

@application.route("/changepass/",methods=['POST'])
def changepass():
    global femail,emailotp1
    emailotp1 = randint(000000,999999)
    femail=request.form['femail']
    cursor=conn.cursor(buffered=True)
    cursor.execute("Select Email from userdata ")
    data = cursor.fetchall()
    for uemail in data:
        if femail == uemail[0]:
            msg1 = Message('OTP VERIFY', sender='#sendermail', recipients=[femail])
            msg1.body = (f"The otp is {emailotp1} to change password ")
            mail.send(msg1)
            return render_template('changepass.html',email1=femail)
    else:
        flash("Email not found!! Try signup.")
        return redirect(url_for('login'))

@application.route("/changepassword/",methods=['POST'])
def changepassword():
    passw=request.form['usrpswd1']
    cpassw=request.form['usrpswd2']
    fotp=request.form['evotp']
    if(int(fotp) == emailotp1):
        if(passw==cpassw):
            hashpswd=bcrypt.generate_password_hash(password=passw)
            cursor=conn.cursor(buffered=True)
            cursor.execute("UPDATE userdata SET Password=%s where Email=%s",(hashpswd,femail))
            conn.commit()
            flash("Password changed Successfully ...! Login again")
            return redirect(url_for('login'))
        else:
            flash("Passwords doesn't match ...Try again")
            return  render_template('changepass.html', email1=femail)
    else :
        flash("Incorrect otp please check or Try again")
        return render_template('changepass.html', email1=femail)

@application.route("/verify/",methods=["POST"])
def verify():
    global gname
    cursor=conn.cursor(buffered=True)
    cursor.execute("Select Email from userdata ")
    data = cursor.fetchall()
    for vemail in data:
        if email== vemail[0]:
            flash("User already exists : Try Login ")
            return redirect(url_for('login'))
    evotp=request.form['evotp']
    if(emailotp == int(evotp)):
        cursor=conn.cursor(buffered=True)
        cursor.execute("INSERT INTO userdata(Name,Email,Phone,Password) Values(%s,%s,%s,%s) " ,(name, email, phone, hashedpassword))
        conn.commit()
        gname=name
        return  redirect(url_for('index'))
    else:
        flash("incorrect !!")
        return  render_template('otp.html')
@application.route("/index/")
def index():
    cursor=conn.cursor(buffered=True)
    cursor.execute("Select * from movies ")
    data=cursor.fetchall()
    cursor.execute("select * from recommended_movies")
    rdata=cursor.fetchall()
    print(rdata)
    return render_template('index.html',movies=data,rmovies=rdata,gname=gname)

@application.route("/bookticket/",methods=['POST'])
def bookticket():
    global nam, mail1
    title=request.form['text1']
    desc=request.form['text2']
    image=request.form['text3']
    usr=request.form['text4']
    cursor=conn.cursor(buffered=True)

    cursor.execute(f"Select Name,Email from userdata where Name='{usr}'")
    data = cursor.fetchall()
    for row in data:
        nam=row[0]
        mail1=row[1]

    return render_template('book.html',title=title,desc=desc,image=image,nam=nam,mail1=mail1)
@application.route('/pay/<Name>/<Email>/<Moviename>/<Theatre>/<Date>/<Timing>/<Number>/<Seats>',methods=['GET','POST'])
def pay(Name,Email,Moviename,Theatre,Date,Timing,Number,Seats):
    checkout_session=stripe.checkout.Session.create(
        success_url=request.host_url+url_for('success_pay',Name=Name,Email=Email,Moviename=Moviename,Theatre=Theatre,Date=Date,Timing=Timing,Number=Number,Seats=Seats),
        line_items=[
            {
                'price_data': {
                    'product_data': {
                        'name': f'Booking For {Moviename}\n{Theatre}\n{Timing} )',
                    },
                    'unit_amount': 177*100,
                    'currency': 'inr',
                },
                'quantity': Number,
            },
            ],
        mode="payment",)
    return redirect(checkout_session.url)
@application.route('/success/<Name>/<Email>/<Moviename>/<Theatre>/<Date>/<Timing>/<Number>/<Seats>')
def success_pay(Name,Email,Moviename,Theatre,Date,Timing,Number,Seats):
    cursor=conn.cursor(buffered=True)
    cursor.execute("INSERT INTO booking(Name,Email,Moviename,Theatre,Date,Timing,Number,Seats) Values(%s,%s,%s,%s,%s,%s,%s,%s) " ,(Name,Email,Moviename,Theatre,Date,Timing,Number,Seats))
    conn.commit()
    msg3 = Message('Ticket Details', sender='#sendermail', recipients=[Email])
    msg3.body = (f"""Hii {Name} , 
                       Moviename:{Moviename} 
                       Theatre:{Theatre}
                       Date:{Date}
                       Timing:{Timing} 
                       Number of Seats:{Number}
                       Seats:{Seats} 

                        Thank you for Booking!! Enjoy !!""")
    mail.send(msg3)
    flash("Tickets Booked Successfully")
    return redirect(url_for('index'))

@application.route("/confirmed/",methods=['POST'])
def confirm():
    Name=request.form['s6']
    Email=request.form['s4']
    Moviename=request.form['s5']
    Theatre=request.form['s10']
    Date=request.form['d1']
    Timing=request.form['s11']
    Number=request.form['s7']
    Seats=request.form['s3']
    return redirect(url_for('pay',Name=Name,Email=Email,Moviename=Moviename,Theatre=Theatre,Date=Date,Timing=Timing,Number=Number,Seats=Seats))
@application.route('/bookings')
def bookings():
    cursor=conn.cursor(buffered=True)
    cursor.execute('SELECT Moviename,Theatre,Timing,Seats,Date from booking where name=%s',[gname])
    data=cursor.fetchall()
    return render_template('bookings.html',data=data)
    
@application.route("/")
def login():
    return render_template('login.html')

if __name__ == "__main__":
    application.run(debug=True)

