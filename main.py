import email
from flask import Flask, redirect, render_template, request, session, url_for, flash , Blueprint
from flask_wtf import FlaskForm

from flask_mysqldb import MySQL
import mysql.connector

from forms import ContactForm



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
    cur.execute("SELECT  * FROM restaurants where grade = 'A'")
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


@app.route('/complaint')
def complaint():
    #cur.execute("SELECT * FROM address")
    #fetchdata =cur.fetchall()
    #cur.close()
    
    cur = mysql.connection.cursor()
    cur.execute("SELECT  * FROM complaint")
    data = cur.fetchall()
    cur.close()

    
    return render_template('complaint.html', complaint=data )



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
    
    

@app.route('/inserts', methods = ['POST'])
def inserts():

    if request.method == "POST":
        flash("Data Inserted Successfully")
        name = request.form['name']
        complaint = request.form['complaint']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO complaint (name, complaint) VALUES (%s, %s)", (name, complaint))
        mysql.connection.commit()
        return redirect(url_for('complaint'))




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
    
    
    

@app.route('/updates',methods=['POST','GET'])
def updates():

    if request.method == 'POST':
        id_data = request.form['id']
        name = request.form['name']
        complaint = request.form['complaint']
        cur = mysql.connection.cursor()
        cur.execute("""
               UPDATE complaint
               SET name=%s, complaint=%s
               WHERE id=%s
            """, (name, complaint, id_data))
        flash("Data Updated Successfully")
        mysql.connection.commit()
        return redirect(url_for('complaint'))

@app.route('/contact', methods = ['POST','GET'])
def contact():
    form = ContactForm()
    if request.method == 'POST':
        name = request.form["name"]
        email = request.form["email"]
        subject = request.form["subject"]
        message = request.form["message"]
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO contact (name, email, subject, message) VALUES (%s,%s,%s,%s)",(name, email, subject, message,))
        mysql.connection.commit()
        print("Data saved!")
        return redirect(url_for("contact_success"))
    else:    
        return render_template("contact.html", form = form) 


@app.route('/contact_success/')
def contact_success():
    return render_template("contact_success.html")


@app.route('/post/', methods = ['POST', 'GET'])
def post():
    if request.method == "POST":
        subject = request.form["subject"]       
        if  (not subject):
            flash('Post cannot be empty', category= 'error')
        else:
            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO blog_post (subject) VALUES (%s)", (subject,))
            mysql.connection.commit()
            return redirect(url_for("blog"))
    return render_template("post.html")


@app.route('/blog/', methods = ['POST', 'GET'])
def blog():
    if request.method == 'GET':
            cur = mysql.connection.cursor()
            cur.execute("SELECT * FROM blog_post")
            #id = listToDict(rows)
            data = cur.fetchall()
    return render_template("blog.html", data = data)

@app.route('/discussion/<id>', methods = ['POST', 'GET'])
def discussion(id):
    if request.method == 'GET':
         
            cur = mysql.connection.cursor()
            cur.execute("SELECT comment FROM blog_com WHERE post_id = %s",(id,))
            #print('data: ',data)
            comment =cur.fetchall()
            cur.execute("SELECT subject FROM blog_post WHERE post_id= %s",(id,))
            subject = cur.fetchall()
            print(comment)
            print(subject)
            cur.close()
            return render_template("post_discussion.html", comment = comment, id =id, subject = subject)

    elif request.method =='POST':
            data = request.form.get("comment")
            print(data)
            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO blog_com (post_id,comment) VALUES (%s,%s)", (id, data,))

            cur.execute("SELECT subject FROM blog_post WHERE post_id= %s",(id,))
            subject = cur.fetchall()

            cur.execute("SELECT comment FROM blog_com WHERE post_id = %s",(id,))
            comments = cur.fetchall()

            mysql.connection.commit() 
            return render_template("post_discussion.html",comments = comments,subject = subject)

    

if __name__ == '__main__':
    app.run(debug=True)
