import 'package:flutter/material.dart';

class NoticeBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF303F9F),
        title: Text('Notice Board'),
      ),
      backgroundColor: const Color(0xFFAAD9FF),
      body: ListView(
        children: [
          _NoticeCard(
            title: 'Important Notice',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis lacinia orci at velit congue blandit. Nam id nisi lectus. Suspendisse potenti.',
            date: '31 Mar 2023',
          ),
          _NoticeCard(
            title: 'Upcoming Event',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis lacinia orci at velit congue blandit. Nam id nisi lectus. Suspendisse potenti.',
            date: '02 Apr 2023',
          ),
          _NoticeCard(
            title: 'Holiday Notice',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis lacinia orci at velit congue blandit. Nam id nisi lectus. Suspendisse potenti.',
            date: '05 Apr 2023',
          ),
        ],
      ),
    );
  }
}

class _NoticeCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  _NoticeCard(
      {required this.title, required this.description, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              date,
              style: TextStyle(fontSize: 14.0, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
