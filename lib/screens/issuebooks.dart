import 'package:flutter/material.dart';

class BookIssueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Issue a Book'),
        centerTitle: true,
      ),
      body: Container(
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
                genre: 'Autobiography', color: Colors.brown, onTap: () {}),
            _buildGenreContainer(
                genre: 'Biography', color: Color(0xFF4A7C59), onTap: () {})
          ],
        ),
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
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
