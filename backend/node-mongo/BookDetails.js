const mongoose = require('mongoose');

const bookDetailsSchema = new mongoose.Schema({
    bookId: { type: String, required: true },
    name: { type: String, required: true },
    author: { type: String, required: true },
    publishedDate: { type: String, required: true },
    image: { type: String, required: true },
    description: { type: String, required: true },
    price: { type: String, required: true },
    availability: { type: Boolean, required: true },
});

const BookDetails = mongoose.model('Books', bookDetailsSchema);

module.exports = BookDetails;