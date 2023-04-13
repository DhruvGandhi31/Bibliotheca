import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/book.dart';
import 'Book Open Page/bookdetails.dart';
import '../model/loaded_books.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // addData() async {
  //   for (var element in books) {
  //     FirebaseFirestore.instance
  //         .collection('Books')
  //         .add(element as Map<String, dynamic>);
  //   }
  //   print('All data added');
  // }

  String name = "";
  TextEditingController _searchController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   _searchController.addListener(_onSearchChanged);
  // }

  // @override
  // void dispose() {
  //   _searchController.removeListener(_onSearchChanged);
  //   _searchController.dispose();
  //   super.dispose();
  // }
  // _onSearchChanged() {
  //   print(_searchController.text);
  // }
  List<Book> display_books = List.from(books);

  void updateList(String value) {
    setState(() {
      display_books = books
          .where((element) =>
              element.title.toLowerCase().contains(value.toString()) ||
              element.author.toLowerCase().contains(value.toString()))
          .toList();
    });
  }

  void navigateToBookDetailPage(BuildContext context, Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            BookDetailPage(onTap: () {}, lastbutton: 'Issue book', book: book),
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
                  onChanged: (value) => updateList(value),
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
                      navigateToBookDetailPage(context, display_books[index]);
                      // Handle book tap event here
                      print('Book ${display_books[index].title} tapped!');
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
