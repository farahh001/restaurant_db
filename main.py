from flask import Flask, render_template

from flask_mysqldb import MySQL
import mysql.connector

app = Flask(__name__)
#add database
app.config['MYSQL_HOST'] ='localhost'
app.config['MYSQL_USER'] ='root'
app.config['MYSQL_PASSWORD'] ='f1234'
app.config['MYSQL_DB'] ='project-1-336'
#
mysql =MySQL(app)

# mydb=mysql.connector.connect(host="127.0.0.1",port="3307",user="root",passwd="farah1234",database="project-1-336")
# mycursor=mydb.connection.cursor()
# mycursor.execute("SELECT * FROM restaurant")





@app.route('/')
def index():
    cur =mysql.connection.cursor()
    cur.execute("SELECT * FROM address")
    fetchdata =cur.fetchall()
    cur.close()

    return render_template("index.html",data =fetchdata)

@app.route('/registration/')
def registration():
    return render_template("registration.html")


if __name__ == '__main__':
    app.run(debug=True)
