import 'package:flutter/material.dart';

class Book {
  final String title;
  final String author;
  final String publishedDate;
  final String image;
  final String description;
  final String bookId;
  final String price;
  final bool availability;

  Book(
      {required this.title,
      required this.author,
      required this.publishedDate,
      required this.image,
      required this.description,
      required this.bookId,
      required this.price,
      required this.availability});
}
