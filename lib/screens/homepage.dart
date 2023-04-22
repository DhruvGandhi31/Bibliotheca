import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:library_management/screens/searchpage.dart';
import 'package:get/get.dart';

import '../utils/book.dart';
import '../utils/bottombutton.dart';
import '../utils/issuedbookslist.dart';
import '../utils/mostpopbookslist.dart';
import '../utils/returnbookslist.dart';
import '../utils/centerbuttons.dart';
import '../model/loaded_books.dart';

import 'Book Open Page/bookdetails.dart';
import 'HomePage/Issued Books/bookslist.dart';
import 'HomePage/Issue a Book/issuebooks.dart';
import 'HomePage/Returned Books/returnbooklist.dart';
import 'messages.dart';
import 'navbar.dart';

class HomePage extends StatefulWidget {
  static String routeName = 'homepage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Book> availableBooks = books;
  List<Book> issuedBooksList = issuedBooks;
  List<Book> returnedBooks = [];
  int num_issued_books = 0;

  List<String> images = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
    'assets/images/7.png',
  ];

  List<String> moreimages = [
    'assets/images/image_1.png',
    'assets/images/image_2.png',
    'assets/images/image_3.png',
    'assets/images/image_4.png',
    'assets/images/image_5.png',
    'assets/images/image_6.png',
    'assets/images/image_7.png',
    'assets/images/image_8.png',
  ];

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => exit(0),
                child: Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  //Function for issuing a book, this books will be added  to issued book list
  //We can view by tapping on 'Return a Book' and inside the booklist these books will be listed

  void toIssueBook(String bookId) async {
    final alreadyIssued =
        issuedBooksList.indexWhere((book) => book.bookId == bookId);
    if (alreadyIssued >= 0) {
      Fluttertoast.showToast(msg: 'The book is already issued');
    } else {
      final book = books.firstWhere((book) => book.bookId == bookId);
      final url = 'http://localhost:3000/issued_books';
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'bookId': book.bookId,
          'name': book.title,
          'author': book.author,
          'publishedDate': book.publishedDate,
          'image': book.image,
          'description': book.description,
          'price': book.price,
          'availability': book.availability.toString(),
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          issuedBooksList.add(book);
          // num_issued_books = issuedBooksList.length;
        });
        Fluttertoast.showToast(
            msg: 'Your book has been issued, please collect it from library.');
      } else {
        Fluttertoast.showToast(msg: 'Failed to issue book');
      }
    }
  }

  void navigateToBookDetailPage(BuildContext context, Book book, String text) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailPage(
            onTap: () {
              toIssueBook(book.bookId);
            },
            lastbutton: text,
            book: book),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          backgroundColor: Color(0xFF303F9F),
          centerTitle: true,
          title: Text('Library'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NoticeBoardScreen()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.message, size: 28, color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFAAD9FF),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchPage(),
                            ));
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.07,
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 7),
                              Icon(Icons.search),
                              SizedBox(width: 4),
                              Text('Search...'),
                            ],
                          )),
                    ),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 /
                          9, // Change this to match your image aspect ratio
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: 1,
                    ),
                    items: images.map((imagePath) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(top: 20),
                            // EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.contain,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    child: const Text(
                      'Most Popular Books',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        // remove the default underline
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 150.0,
                      enlargeCenterPage: false,
                      autoPlay: false,
                      aspectRatio: 2 / 3,
                      padEnds: false,
                      enableInfiniteScroll: false,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      disableCenter: true,
                      viewportFraction: 0.3,
                    ),
                    items: mostPopularBooks.map((book) {
                      return Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {
                              navigateToBookDetailPage(
                                  context, book, 'Issue Book');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: Image.network(
                                  book.image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  CenterButton(
                      buttonColor: const Color(0xFF0E6BA8),
                      buttonText: 'Issue a Book',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookIssueScreen()));
                      }),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10),
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BottomButton(
                          containerColor: const Color(0xFF0E6BA8),
                          number: retrun_num_issued_books(),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BookListPage(books: issuedBooksList)));
                          },
                          text: 'Return a book',
                          icondata: Icons.book_sharp,
                        ),
                        const SizedBox(width: 20), // SizedBox(width: 20),
                        BottomButton(
                          containerColor: const Color(0xFF0E6BA8),
                          number: returnedBooks.length,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReturnBookListPage(
                                        books: returnedBooks)));
                          },
                          text: 'History',
                          icondata: Icons.history,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
