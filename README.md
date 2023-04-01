# library_mangement

Please note that the SignUp feature uses MySQL database for saving a records of users. For implemeting PHP is used as backend which provides the api and service to connect to localhost. The server is hosted on XAMPP which is connected locally. If you want to test this application please download the XAMPP. And add 'api_lib_manage' which is in PHP folder to the htdocs of the downloaded location of XAMPP. 

# Guide for node js backend

To test backend and connect to MySQL first you need to go to the Nodejs_JWT folder in backend. Then on command-prompt you need to type 'npm i bcryptjs express express-unless jsonwebtoken mongoose mongoose-unique-validator mysql' in that directory. Then type 'nodemon index.js'. Please note to run this application you need to install nodemon which can be installed by using 'npm install -g nodemon' on cmd. After running this application you must see 'Ready To Go! \n Connected to MySQL database'.
