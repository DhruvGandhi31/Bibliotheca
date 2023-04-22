import 'package:flutter/material.dart';
import '../../searchpage.dart';

class BookIssueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAAD9FF),
      appBar: AppBar(
        backgroundColor: Color(0xFF303F9F),
        title: Text('Issue a Book'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
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
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: [
                  _buildGenreContainer(
                      genre: 'History', color: Colors.blue, onTap: () {}),
                  _buildGenreContainer(
                      genre: 'Encyclopedia', color: Colors.red, onTap: () {}),
                  _buildGenreContainer(
                      genre: 'Novels', color: Colors.green, onTap: () {}),
                  _buildGenreContainer(
                      genre: 'Horror', color: Colors.orange, onTap: () {}),
                  _buildGenreContainer(
                      genre: 'Autobiography',
                      color: Colors.brown,
                      onTap: () {}),
                  _buildGenreContainer(
                      genre: 'Biography',
                      color: Color(0xFF4A7C59),
                      onTap: () {})
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenreContainer(
      {required String genre, required Color color, required Function onTap}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            genre,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
