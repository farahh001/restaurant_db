import email
from flask import Flask, redirect, render_template, request, session, url_for, flash
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
        flash("You are successfully registered as an Inspector")
        
        
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
            msg='Incorrect email/Password.Try again'
            
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


if __name__ == '__main__':
    app.run(debug=True)
