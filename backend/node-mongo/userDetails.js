const mongoose = require('mongoose');

const userDetailsSchema = new mongoose.Schema({
    name: { type: String, required: true },
    gender: { type: String, required: true },
    dob: { type: Date, required: true },
    email: { type: String, required: true },
    phone_no: { type: String, required: true },
    student_id: { type: String, required: true },
    pswd: { type: String, required: true },
});

const UserDetails = mongoose.model('user_details', userDetailsSchema);

module.exports = UserDetails;
