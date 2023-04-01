import 'package:flutter/material.dart';

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
              backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
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
            leading: Icon(Icons.shopping_cart),
            title: const Text('Your Orders'),
            onTap: () {
              // Navigate to your orders screen
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
