import 'package:flutter/material.dart';

class SidebarScreen extends StatefulWidget {
  @override
  _SidebarScreenState createState() => _SidebarScreenState();
}

class _SidebarScreenState extends State<SidebarScreen> {
  bool isSidebarOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content
          Container(
            color: Colors.white,
            child: Center(
              child: Text('Main content'),
            ),
          ),
          // Sidebar
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            top: 0,
            bottom: 0,
            left: isSidebarOpen ? 0 : -200,
            child: Container(
              width: 200,
              color: Colors.grey[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // User photo at the top center
                  Container(
                    height: 120,
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        'https://www.example.com/user/photo.jpg',
                      ),
                    ),
                  ),
                  // Sidebar options
                  Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Your profile'),
                        onTap: () {
                          // TODO: Navigate to user's profile
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.shopping_cart),
                        title: Text('Your orders'),
                        onTap: () {
                          // TODO: Navigate to user's orders
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.subscriptions),
                        title: Text('Subscriptions'),
                        onTap: () {
                          // TODO: Navigate to user's subscriptions
                        },
                      ),
                    ],
                  ),
                  // Log out at the bottom
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Log out'),
                    onTap: () {
                      // TODO: Log out the user
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
