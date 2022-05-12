import email
from socket import create_connection
from django.db import connection
from flask import Flask, redirect, render_template, request, session, url_for, flash, g

from flask_wtf import FlaskForm
import urllib.request
import os
from werkzeug.utils import secure_filename
from flask_mysqldb import MySQL
import mysql.connector

app = Flask(__name__)

UPLOAD_FOLDER = 'static/uploads/'

#add database
app.config['MYSQL_HOST'] ='localhost'
app.config['MYSQL_USER'] ='root'
app.config['MYSQL_PASSWORD'] =''
app.config['MYSQL_DB'] ='project-1-336'
#

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024

ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg', 'gif'])
 
def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

app.secret_key = "super secret key"
app.config['SQLALCHEMY_DATABASE_URI'] ='mysql://root:f1234@localhost/project-1-336'
mysql =MySQL(app)




@app.route('/')
def home():
    #cur.execute("SELECT * FROM address")
    #fetchdata =cur.fetchall()
    #cur.close()
    
    cur = mysql.connection.cursor()
    cur.execute("SELECT  * FROM restaurants")
    data = cur.fetchall()
    cur.close()

    
    return render_template('home.html', restaurants=data )


@app.route('/inspection')
def inspection():
    #cur.execute("SELECT * FROM address")
    #fetchdata =cur.fetchall()
    #cur.close()
    
    cur = mysql.connection.cursor()
    cur.execute("SELECT  * FROM restaurants")
    data = cur.fetchall()
    cur.close()

    
    return render_template('inspection.html', restaurants=data )




@app.route('/register', methods =['GET','POST'])
def register():
    
    if request.method == 'GET':
        return render_template("registration.html")
    else:
        email=request.form['email']
        password=request.form['password']
        flash("You are successfully registered")
        
        
        # returns True
        cur =mysql.connection.cursor()
        cur.execute("INSERT INTO user (email,password) VALUES(%s,%s)", (email,password))
        mysql.connection.commit()
        session['email']= email
        
        return redirect(url_for("register"))
    
  

@app.route('/login', methods =['GET','POST'])
def login():
    msg=''
    cur =mysql.connection.cursor()
    if request.method=='POST':
        email =request.form['email']
        password =request.form['password']
        cur.execute('SELECT * FROM user WHERE email=%s AND 	password=%s',(email,password))
        record = cur.fetchone()
        if record:
            session['loggedin']=True
            session['email']= record[1]
            return redirect(url_for('inspection'))
        else:
            flash("Incorrect email/Password.Try again")
            
            
    return render_template("login.html",msg=msg)





@app.route('/about/')
def about():
    return render_template("about.html")



        

    
    
    
    
    
        
        
        
    
        
        
@app.route ('/logout')
def logout():
    session.pop('loggedin',None)
    session.pop('email',None)
    return redirect(url_for('home'))



@app.route('/insert', methods = ['POST'])
def insert():

    if request.method == "POST":
        flash("Data Inserted Successfully")
        name = request.form['name']
        address = request.form['address']
        grade = request.form['grade']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO restaurants (name, address, grade) VALUES (%s, %s, %s)", (name, address, grade))
        mysql.connection.commit()
        return redirect(url_for('inspection'))




@app.route('/delete/<string:id_data>', methods = ['GET'])
def delete(id_data):
    flash("Record Has Been Deleted Successfully")
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM restaurants WHERE id=%s", (id_data,))
    mysql.connection.commit()
    return redirect(url_for('inspection'))





@app.route('/update',methods=['POST','GET'])
def update():

    if request.method == 'POST':
        id_data = request.form['id']
        name = request.form['name']
        address = request.form['address']
        grade = request.form['grade']
        cur = mysql.connection.cursor()
        cur.execute("""
               UPDATE restaurants
               SET name=%s, address=%s, grade=%s
               WHERE id=%s
            """, (name, address, grade, id_data))
        flash("Data Updated Successfully")
        mysql.connection.commit()
        return redirect(url_for('inspection'))
    
@app.route('/restaurant')
def restaurant():
    return render_template('restaurant.html')
    
    
@app.route('/', methods=['POST'])
def upload_image():
    if 'file' not in request.files:
        flash('No file part')
        return redirect(request.url)
    file = request.files['file']
    if file.filename == '':
        flash('No image selected for uploading')
        return redirect(request.url)
    if file and allowed_file(file.filename):
        filename = secure_filename(file.filename)
        file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        
        
        return render_template('restaurant.html', filename=filename)
    else:
        flash('Allowed image types are - png, jpg, jpeg, gif')
        return redirect(request.url)
 
@app.route('/display/<filename>')
def display_image(filename):
    #print('display_image filename: ' + filename)
    return redirect(url_for('static', filename='uploads/' + filename), code=301)


if __name__ == '__main__':
    app.run(debug=True)