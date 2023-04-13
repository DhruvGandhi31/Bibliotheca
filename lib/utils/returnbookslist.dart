import 'package:flutter/material.dart';

import 'book.dart';

List<Book> returnedBooks = [
  Book(
    bookId: '1',
    title: 'Wings Of Fire',
    author: 'A P J Abdul Kalam',
    publishedDate: '1999',
    image:
        'https://m.media-amazon.com/images/I/91jib9oFZDL._AC_UF350,350_QL50_.jpg',
    description:
        '"Wings of Fire" is an autobiography written by former President of India, Dr. A.P.J. Abdul Kalam, describing his life journey from a small town to becoming a renowned scientist and eventually the President of India, with insights on his contributions to the Indian space and missile programs.',
    price: '500',
    availability: true,
  ),
  Book(
    bookId: '2',
    title: 'Playing It My Way',
    author: 'Sachin Tendulkar',
    publishedDate: '2014',
    image: 'https://m.media-amazon.com/images/I/41PrmmLat4L.jpg',
    description:
        'Playing it My Way is an autobiography of Indian cricket legend Sachin Tendulkar, detailing his personal and professional life, including his early childhood, cricket career, and his experiences and insights on the game of cricket.',
    price: '600',
    availability: false,
  ),
];
