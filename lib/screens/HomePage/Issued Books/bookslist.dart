import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:library_management/utils/issuedbookslist.dart';
import 'package:http/http.dart' as http;
// import '../../../model/loaded_books.dart';
import '../../../utils/book.dart';
import '../../../utils/centerbuttons.dart';
import '../../Book Open Page/bookdetails.dart';
import '../Issue a Book/issuebooks.dart';
import 'package:intl/intl.dart';

class BookListPage extends StatefulWidget {
  final List<Book> books;

  BookListPage({required this.books});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  List<Book> tot_books = issuedBooks;
  final dueDate = DateTime.now().add(Duration(days: 21));

  Future<void> returnBook(String bookId) async {
    setState(() {
      tot_books.remove(tot_books.firstWhere((book) => book.bookId == bookId));
      Fluttertoast.showToast(msg: 'Book returned to Library');
    });
    updateReturnedBooks(tot_books, bookId);
    final url = 'http://localhost:3000/api/return-book/$bookId';
    final response = await http.delete(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        tot_books.remove(tot_books.firstWhere((book) => book.bookId == bookId));
      });
      Fluttertoast.showToast(msg: 'Book returned to Library');
      Navigator.pop(context);
    } else {
      Fluttertoast.showToast(msg: 'Failed to return book');
    }
    Navigator.pop(context);
  }

  void addToHistory(String bookId) {
    setState(() {});
  }

  void navigateToBookDetailPage(BuildContext context, Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailPage(
            onTap: () {
              returnBook(book.bookId);
            },
            lastbutton: 'Return Book',
            book: book),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF303F9F),
        title: Text('Book List'),
      ),
      backgroundColor: const Color(0xFFAAD9FF),
      body: tot_books.length == 0
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You have not issued any books yet. ',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900]),
                ),
                Text(
                  'PLease feel free to browse and select any book you like from our collection here.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900]),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: CenterButton(
                      buttonColor: const Color(0xFF0E6BA8),
                      buttonText: 'Browse',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookIssueScreen()));
                      }),
                ),
              ],
            )
          : ListView.builder(
              itemCount: tot_books.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    navigateToBookDetailPage(context, tot_books[index]);
                    // Handle book tap event here
                    print('Book ${tot_books[index].title} tapped!');
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
                              image: NetworkImage(tot_books[index].image),
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
                                tot_books[index].title,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'by ${tot_books[index].author}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 15),
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    DateFormat.yMMMd().format(dueDate),
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
