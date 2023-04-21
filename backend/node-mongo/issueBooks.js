const mongoose = require('mongoose');

const bookDetailsSchema = new mongoose.Schema({
    bookId: { type: String },
    name: { type: String },
    author: { type: String },
    publishedDate: { type: String },
    image: { type: String },
    description: { type: String },
    price: { type: String },
    availability: { type: Boolean },
});

const issueBook = mongoose.model('Issued Books', bookDetailsSchema);

module.exports = issueBook;