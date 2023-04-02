import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../utils/book.dart';
import '../utils/bottombutton.dart';
import '../utils/mostpopbookslist.dart';
import 'Book Open Page/bookdetails.dart';
import 'HomePage/Issued Books/bookslist.dart';
import 'HomePage/Issue a Book/issuebooks.dart';
import 'messages.dart';
import 'navbar.dart';
import '../utils/centerbuttons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  void navigateToBookDetailPage(BuildContext context, Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            BookDetailPage(onTap: () {}, lastbutton: 'Issue Book', book: book),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search by ISBN...',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio:
                        16 / 9, // Change this to match your image aspect ratio
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
                  items: books.map((book) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            navigateToBookDetailPage(context, book);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 3.0),
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Image.asset(
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
                CenterButton(
                    buttonColor: const Color(0xFF1B4F72),
                    buttonText: 'Return a Book',
                    onPressed: () {}),
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
                          number: 17,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BookListPage(books: books)));
                          },
                          text: 'Issued Books'),
                      const SizedBox(width: 20), // SizedBox(width: 20),
                      BottomButton(
                          containerColor: const Color(0xFF1B4F72),
                          number: 23,
                          onTap: () {},
                          text: 'Returned Books'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
