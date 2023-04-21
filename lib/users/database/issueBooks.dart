import 'dart:convert';
import 'package:http/http.dart' as http;

final apiUrl = 'http://localhost:3000/books';

Future<List<Book>> getBooks() async {
  final response = await http.get(apiUrl as Uri);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as List<dynamic>;
    final books = data.map((e) => Book.fromJson(e)).toList();
    return books;
  } else {
    throw Exception('Failed to load books');
  }
}

class Book {
  final String id;
  final String name;
  final String author;
  final String publishedDate;
  final String image;
  final String description;
  final String price;
  final bool availability;

  Book({
    required this.id,
    required this.name,
    required this.author,
    required this.publishedDate,
    required this.image,
    required this.description,
    required this.price,
    required this.availability,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['bookId'],
      name: json['name'],
      author: json['author'],
      publishedDate: json['publishedDate'],
      image: json['image'],
      description: json['description'],
      price: json['price'],
      availability: json['availability'],
    );
  }
}
