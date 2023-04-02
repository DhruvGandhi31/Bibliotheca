const express = require('express');
const mongoose = require('mongoose');
const auth = require('./middlewares/auth');
const errors = require('./middlewares/error');

const app = express();
mongoose.Promise = global.Promise;
const mysql = require('mysql');
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'library_management'
});

connection.connect((err) => {
    if (err) throw err;
    console.log('Connected to MySQL database!');
});

app.use((req, res, next) => {
    if (req.path === '/users/login' || req.path === '/users/register') {
        next();
    } else {
        auth.authenticateToken(req, res, next);
    }
});

app.use(express.json());

app.use("/users", require("./routes/users.routes"));

app.use(errors.errorHandler);

app.listen(process.env.PORT || 4000, function () {
    console.log("Ready to Go!");
});
