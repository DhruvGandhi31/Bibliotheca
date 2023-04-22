const mongoose = require('mongoose');

// const bookDetailsSchema = new mongoose.Schema({
//     bookId: { type: String, required: true },
//     name: { type: String, required: true },
//     author: { type: String, required: true },
//     publishedDate: { type: String, required: true },
//     image: { type: String, required: true },
//     description: { type: String, required: true },
//     price: { type: String, required: true },
//     availability: { type: String, required: true },
// });
const bookDetailsSchema = new mongoose.Schema({
    bookId: { type: String },
    name: { type: String },
    author: { type: String },
    publishedDate: { type: String },
    image: { type: String },
    description: { type: String },
    price: { type: String },
    availability: { type: String },
});

const issueBook = mongoose.model('issued_books', bookDetailsSchema);

module.exports = issueBook;