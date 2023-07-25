# Bibliotheca (Library Management System - User side)

## Guide for node js backend

To test backend and connect to MySQL first you need to go to the Nodejs_JWT folder in backend. Then on command-prompt you need to type 'npm i bcryptjs express express-unless jsonwebtoken mongoose mongoose-unique-validator mysql' in that directory. Then type 'nodemon index.js'. Please note to run this application you need to install nodemon which can be installed by using 'npm install -g nodemon' on cmd. After running this application you must see 'Ready To Go! \n Connected to MySQL database'.

## Search Among Books
The search feature has been added to the app. You can search by book name or author's name. You can also search by keywords of a book. Also it searchs locally i.e. it find the books which are locally added into the app.

## Other changes
1) The image is loaded throuogh URL instead of assets.
2) Additional Books are added.
