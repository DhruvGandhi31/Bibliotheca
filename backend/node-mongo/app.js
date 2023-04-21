const express = require('express');
const app = express();
const db = require('./db');
const issueBook = require('./issueBooks');

app.get('/books', (req, res) => {
    issueBook.find()
        .then((books) => {
            res.json(books);
        })
        .catch((err) => {
            console.error(err);
            res.status(500).json({ error: 'Something went wrong' });
        });
});

app.post('/api/issue-book', (req, res) => {
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

app.listen(3000, () => {
    console.log('Server started on port 3000');
});
