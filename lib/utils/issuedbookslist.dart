import 'package:flutter/material.dart';

import 'book.dart';

List<Book> issuedBooks = [];

int numIssuedBooks = 0;

List<Book> updateIssuedBooks(List<Book> books) {
  issuedBooks.addAll(books);
  numIssuedBooks = issuedBooks.length;
  print(numIssuedBooks);
  return issuedBooks;
}

List<Book> updateReturnedBooks(List<Book> books, String bookId) {
  issuedBooks.remove(bookId);
  numIssuedBooks = issuedBooks.length;
  print(numIssuedBooks);
  return issuedBooks;
}

int retrun_num_issued_books() {
  return numIssuedBooks = issuedBooks.length;
}
