import email
from flask import Flask, redirect, render_template, request, session, url_for
from flask_wtf import FlaskForm

from flask_mysqldb import MySQL
import mysql.connector



app = Flask(__name__)


#add database
app.config['MYSQL_HOST'] ='localhost'
app.config['MYSQL_USER'] ='root'
app.config['MYSQL_PASSWORD'] =''
app.config['MYSQL_DB'] ='project-1-336'
#


app.secret_key = "super secret key"
app.config['SQLALCHEMY_DATABASE_URI'] ='mysql://root:f1234@localhost/project-1-336'
mysql =MySQL(app)

# mydb=mysql.connector.connect(host="127.0.0.1",port="3307",user="root",passwd="farah1234",database="project-1-336")
# mycursor=mydb.connection.cursor()
# mycursor.execute("SELECT * FROM restaurant")


@app.route('/')
def index():
    #cur.execute("SELECT * FROM address")
    #fetchdata =cur.fetchall()
    #cur.close()

    return render_template("index.html")

@app.route("/home")
def home():
    return render_template('home.html', email =session['email'])



@app.route('/register', methods =['GET','POST'])
def register():
    if request.method == 'GET':
        return render_template("registration.html")
    else:
        email=request.form['email']
        password=request.form['password']
        
        
        # returns True
        cur =mysql.connection.cursor()
        cur.execute("INSERT INTO user (email,password) VALUES(%s,%s)", (email,password))
        mysql.connection.commit()
        session['email']= email
        return redirect(url_for("home"))
    
  

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
            return redirect(url_for('home'))
        else:
            msg='Incorrect email/Password.Try again'
            
    return render_template("index.html",msg=msg)

@app.route('/registration/')
def registration():
    return render_template("registration.html")



@app.route ('/logout')
def logout():
    session.pop('loggedin',None)
    session.pop('email',None)
    return redirect(url_for('login'))


if __name__ == '__main__':
    app.run(debug=True)
