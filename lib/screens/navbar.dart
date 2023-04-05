import 'package:flutter/material.dart';
import '../utils/returnbookslist.dart';
import 'HomePage/Returned Books/returnbooklist.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("User Name"),
            accountEmail: Text("user@email.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/image_6.png'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: const Text('Your Profile'),
            onTap: () {
              // Navigate to your profile screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('History'),
            onTap: () {
              // Navigate to your orders screen
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ReturnBookListPage(books: returnedBooks)));
            },
          ),
          ListTile(
            leading: Icon(Icons.subscriptions),
            title: const Text('Subscriptions'),
            onTap: () {
              // Navigate to subscriptions screen
            },
          ),
          Spacer(),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {
              // Perform log out action
            },
          ),
        ],
      ),
    );
  }
}
