const bcrypt = require("bcryptjs");
const auth = require("../middlewares/auth");
const mySQL = require('mysql');
const db = require('../config/db.config');

async function login({ email, pswd }, callback) {

    let selectQuery = 'SELECT COUNT(*) as "total", ?? FROM ?? WHERE ?? = ? LIMIT 1';
    let query = mySQL.format(selectQuery, ["pswd", "user_register", "email", email]);

    db.query(query, (err, data) => {
        if (err) {
            return callback(err);
        }

        if (data[0].total == 0) {
            return callback({
                message: "Invalid Email/pswd!"
            });
        }

        else {
            if (bcrypt.compareSync(pswd, data[0].pswd)) {
                const token = auth.generateAccessToken(email);
                return callback(null, { token });
            }
            else {
                return callback({
                    message: "Invalid Email/pswd!"
                })
            }
        }
    });


}

async function register(params, callback) {
    if (params.email === undefined || params.username === undefined || params.pswd === undefined || params.phone_no === undefined || params.student_id === undefined) {
        return callback({ message: "All fields are required" });
    }

    let selectQuery = 'SELECT COUNT(*) as "total", ?? FROM ?? WHERE ?? = ? LIMIT 1';
    let query = mySQL.format(selectQuery, [
        "user_register",
        "email",
        params.email,
    ]);

    db.query(query, (err, data) => {
        if (err) {
            return callback(err);
        }

        if (data[0].total > 0) {
            return callback({
                message: "Email Already exists"
            });
        }

        else {
            db.query(`INSERT INTO user_register(username, email, phone_no, student_id, pswd)
            VALUES(?, ?, ?, ?, ?)`, [
                params.username, params.email, params.phone_no, params.student_id, params.pswd
            ],
                (error, results, fields) => {
                    if (error) {
                        return callback(error);
                    }

                    return callback(null, "User registration successful");
                });
        }
    });

}

module.exports = {
    login,
    register
}
