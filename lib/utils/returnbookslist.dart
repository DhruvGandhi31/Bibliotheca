import 'package:flutter/material.dart';

import 'book.dart';

List<Book> returnedBooks = [];

int numReturnedBooks = 0;

List<Book> updateIssuedBooks(List<Book> books) {
  returnedBooks.addAll(books);
  numReturnedBooks = returnedBooks.length;
  print(numReturnedBooks);
  return returnedBooks;
}
