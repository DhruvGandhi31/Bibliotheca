const express = require('express');
const app = express();
const db = require('./db');
const issueBook = require('./issueBooks');
const BookDetails = require('./BookDetails');

app.get('/books', (req, res) => {
    BookDetails.find()
        .then((books) => {
            res.json(books);
        })
        .catch((err) => {
            console.error(err);
            res.status(500).json({ error: 'Something went wrong' });
        });
});
app.use(express.json());

app.post('/issued_books', (req, res) => {
    console.log(req.body);

    var issue = new issueBook(req.body);
    issue.save()
        .then((savedBook) => {
            console.log(savedBook);
            res.status(200).json(savedBook);
        })
        .catch((error) => {
            console.log(error);
            res.status(500).send('Error in saving book');
        });
});
app.delete('/api/return-book/:id', (req, res) => {
    const bookId = req.params.id;
    console.log(bookId);
    issueBook.deleteOne({ bookId })
        .exec()
        .then(result => {
            console.log(result);
            res.status(200).json({ message: "Book returned successfully" });
        })
        .catch(error => {
            console.log(error);
            res.status(500).json({ error: error });
        });
});



// fetch('http://localhost:3000/api/issue-book', {
//     method: 'POST',
//     headers: {
//         'Content-Type': 'application/json'
//     },
//     body: JSON.stringify({
//         bookId: '123',
//         name: 'The Great Gatsby',
//         author: 'F. Scott Fitzgerald',
//         publishedDate: '1925',
//         image: 'http://example.com/great-gatsby.jpg',
//         description: 'A novel about the decadence of the Jazz Age in America.',
//         price: '$10.99',
//         availability: 'true'
//     })
// });


app.listen(3000, () => {
    console.log('Server started on port 3000');
});
