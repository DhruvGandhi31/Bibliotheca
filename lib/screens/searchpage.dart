import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:library_management/utils/issuedbookslist.dart';

import '../utils/book.dart';
import 'Book Open Page/bookdetails.dart';
import '../model/loaded_books.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  static String routeName = 'searchPage';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Book> availableBooks = books;
  List<Book> issuedBooksFromSearchPage = [];
  List<Book> returnedBooks = [];
  List<Book> display_books = List.from(books);
  String name = "";
  TextEditingController _searchController = TextEditingController();

  void updateList(String value) {
    setState(() {
      display_books = books
          .where((element) =>
              element.title.toLowerCase().contains(value.toString()) ||
              element.author.toLowerCase().contains(value.toString()))
          .toList();
    });
  }

  void IssueOrReturn(String bookId, String text) {
    if (text == 'Issue Book') {
      toIssueBook(bookId);
    } else if (text == 'Return Book') {
      toReturnBook(bookId);
    } else {
      print('Error occured');
      Fluttertoast.showToast(msg: 'Error occured');
    }
  }

  //Function for issuing a book, this books will be added  to issued book list
  //We can view by tapping on 'Return a Book' and inside the booklist these books will be listed
  void toIssueBook(String bookId) {
    final alreadyIssued =
        issuedBooks.indexWhere((book) => book.bookId == bookId);
    if (alreadyIssued >= 0) {
      Fluttertoast.showToast(msg: 'The book is already issued');
    } else {
      setState(() {
        issuedBooks.add(books.firstWhere((book) => book.bookId == bookId));
      });
      sendToIssuedBookList();
      Fluttertoast.showToast(
          msg: 'Your book has been issued, please collect it from library.');
    }
  }

  void sendToIssuedBookList() {
    updateIssuedBooks(issuedBooksFromSearchPage);
  }

  void toReturnBook(String bookId) {}

  void navigateToBookDetailPage(BuildContext context, Book book, String text) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailPage(
            onTap: () {
              IssueOrReturn(book.bookId, text);
            },
            lastbutton: text,
            book: book),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAAD9FF),
      appBar: AppBar(
        backgroundColor: Color(0xFF303F9F),
        centerTitle: false,
        title: Text('Search Books'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            Center(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  onChanged: (value) => updateList(value.toLowerCase()),
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                itemCount: display_books.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      navigateToBookDetailPage(
                          context, display_books[index], 'Issue Book');
                      // Handle book tap event here
                      // print('Book ${display_books[index].title} tapped!');
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(display_books[index].image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  display_books[index].title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'by ${display_books[index].author}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              // child: StreamBuilder<QuerySnapshot>(
              //   stream:
              //       FirebaseFirestore.instance.collection('Books').snapshots(),
              //   builder: (context, snapshot) {
              //     return (snapshot.connectionState == ConnectionState.waiting)
              //         ? Center(
              //             child: CircularProgressIndicator(),
              //           )
              //         : ListView.builder(
              //             itemCount: snapshot.data!.docs.length,
              //             itemBuilder: (context, index) {
              //               var data = snapshot.data!.docs[index].data()
              //                   as Map<String, dynamic>;
              //               if (name.isEmpty) {
              //                 return GestureDetector(
              //                   onTap: () {
              //                     navigateToBookDetailPage(
              //                         context, books[index]);
              //                     // Handle book tap event here
              //                     print('Book ${books[index].title} tapped!');
              //                   },
              //                   child: Padding(
              //                     padding: EdgeInsets.all(8.0),
              //                     child: Row(
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.start,
              //                       children: [
              //                         Container(
              //                           width: 100,
              //                           height: 150,
              //                           decoration: BoxDecoration(
              //                             borderRadius:
              //                                 BorderRadius.circular(10),
              //                             image: DecorationImage(
              //                               image: NetworkImage(
              //                                   books[index].image),
              //                               fit: BoxFit.cover,
              //                             ),
              //                           ),
              //                         ),
              //                         SizedBox(width: 16),
              //                         Expanded(
              //                           child: Column(
              //                             crossAxisAlignment:
              //                                 CrossAxisAlignment.start,
              //                             children: [
              //                               Text(
              //                                 books[index].title,
              //                                 style: TextStyle(
              //                                   fontSize: 20,
              //                                   fontWeight: FontWeight.bold,
              //                                 ),
              //                               ),
              //                               SizedBox(height: 8),
              //                               Text(
              //                                 'by ${books[index].author}',
              //                                 style: TextStyle(
              //                                   fontSize: 16,
              //                                   color: Colors.grey[600],
              //                                 ),
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 );
              //               }

              //               return GestureDetector(
              //                 onTap: () {
              //                   navigateToBookDetailPage(context, books[index]);
              //                   // Handle book tap event here
              //                   print('Book ${books[index].title} tapped!');
              //                 },
              //                 child: Padding(
              //                   padding: EdgeInsets.all(8.0),
              //                   child: Row(
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       Container(
              //                         width: 100,
              //                         height: 150,
              //                         decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(10),
              //                           image: DecorationImage(
              //                             image:
              //                                 NetworkImage(books[index].image),
              //                             fit: BoxFit.cover,
              //                           ),
              //                         ),
              //                       ),
              //                       SizedBox(width: 16),
              //                       Expanded(
              //                         child: Column(
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           children: [
              //                             Text(
              //                               books[index].title,
              //                               style: TextStyle(
              //                                 fontSize: 20,
              //                                 fontWeight: FontWeight.bold,
              //                               ),
              //                             ),
              //                             SizedBox(height: 8),
              //                             Text(
              //                               'by ${books[index].author}',
              //                               style: TextStyle(
              //                                 fontSize: 16,
              //                                 color: Colors.grey[600],
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               );
              //             },
              //           );
              //   },
              // ),
            )
          ],
        ),
      )),
    );
  }
}
