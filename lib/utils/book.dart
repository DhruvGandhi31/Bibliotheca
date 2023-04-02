import 'package:flutter/material.dart';

class Book {
  final String title;
  final String author;
  final String publishedDate;
  final String image;
  final String description;

  Book({
    required this.title,
    required this.author,
    required this.publishedDate,
    required this.image,
    required this.description,
  });
}
