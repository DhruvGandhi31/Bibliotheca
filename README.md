# Bibliotheca (Library Management System - User side)
This project is a Flutter-based application designed to facilitate book browsing, borrowing, and returning functionalities for users. MongoDB is utilized as the database management system to store book information and user borrowing records.

Key Features:

- Flutter-based Application: The frontend of the application is developed using Flutter, a popular framework for building cross-platform mobile applications. Flutter allows for a consistent user experience across both Android and iOS devices.

- Book Browsing, Borrowing, and Returning: Users can browse the available books in the system, borrow books they are interested in, and return books once they have finished reading them. These functionalities are essential for managing a library system efficiently.

- MongoDB for Database Management: MongoDB, a NoSQL database, is chosen for database management. It provides flexibility in storing various types of data, which is advantageous for managing diverse book information and user records.

- Robust Search Algorithm: A robust search algorithm is implemented to enable users to search for books by name and author. This feature enhances the user experience by allowing users to quickly find the books they are interested in.

- Node.js and Express.js Backend: The backend functionality of the application is implemented using Node.js, a server-side JavaScript runtime, and Express.js, a web application framework for Node.js. These technologies enable the implementation of server-side logic and routing for handling requests from the Flutter frontend.

- JSON for Data Exchange: JSON (JavaScript Object Notation) is used for data exchange between the frontend and backend components of the application. JSON provides a lightweight and human-readable format for transmitting data, making it ideal for communication between different parts of the system.

## Guide for node js backend

To test backend and connect to MongoDB first you need to go to the Nodejs_JWT folder in backend. Then on command-prompt you need to type 'npm i bcryptjs express express-unless jsonwebtoken mongoose mongoose-unique-validator mysql' in that directory. Then type 'nodemon app.js'. Please note to run this application you need to install nodemon which can be installed by using 'npm install -g nodemon' on cmd. After running this application you must see 'Ready To Go! \n Connected to MongoDB database.

## Search Among Books
The search feature has been added to the app. You can search by book name or author's name. You can also search by keywords of a book. Also it searchs locally i.e. it find the books which are locally added into the app.

## Other changes
1) The image is loaded throuogh URL instead of assets.
2) Additional Books are added.

## Images of the App
<img src="https://github.com/DhruvGandhi31/Bibliotheca/assets/96539582/9e9717d2-ff33-4137-9168-3b22a1a635dd" width=300px>
<img src="https://github.com/DhruvGandhi31/Bibliotheca/assets/96539582/ae2f6b3f-b586-45b6-b5bc-986a5f07fa8e" width=300px>
<img src="https://github.com/DhruvGandhi31/Bibliotheca/assets/96539582/5b3e9b5c-b168-4f0d-bae9-7f5883bd56f5" width=300px>
<img src="https://github.com/DhruvGandhi31/Bibliotheca/assets/96539582/2f1763ea-1fa4-4912-b9bd-ce934fc7b64c" width=300px>
<img src="https://github.com/DhruvGandhi31/Bibliotheca/assets/96539582/220b45e9-1983-4daf-bf96-f50562422a14" width=300px>
<img src="https://github.com/DhruvGandhi31/Bibliotheca/assets/96539582/771be99f-d996-46ff-8033-bb2936b10c09" width=300px>
<img src="https://github.com/DhruvGandhi31/Bibliotheca/assets/96539582/c5475298-b134-4070-9e9c-0e69fe8b6200" width=300px>
<img src="https://github.com/DhruvGandhi31/Bibliotheca/assets/96539582/b84eb922-4308-48be-94bf-5250bc542692" width=300px>



