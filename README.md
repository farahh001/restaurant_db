# Blue Bird(restaurant_finder)

# Running the project locally:
1. I connected with mysql PHPMyAdmin (http://localhost/phpmyadmin). I was having issues with db configuration in workbench.
 Download phpadmin XAMP--> https://www.youtube.com/watch?v=-f8N4FEQWyY 
3. Clone the project. Open gitbash/terminal and then Create a virtual environment 

```
python -m venv res_env
```

Activation(gitbash)
```
res_env/Scripts/activate
``` 
 ->activation is different for MAC. You have to create a virtual environment and activate it accordingly. The following 2 links might help
 1. https://www.youtube.com/watch?v=iw7KRwRcCwA
 2. https://phoenixnap.com/kb/install-flask
 
 3. install all the requirements before running the application
  essentially
  ```
 1. pip install flask
``` 
  ```
 2. pip install mysql-connector
``` 
  ```
 3. pip install flask-mysqldb
``` 

 4. You have to change the db host,username,password in main.py depending on what you have set while downloading  MySQL on phpadmin
 5. RUN THE SERVER -> 
   ```
 python -m flask run
``` 

              


