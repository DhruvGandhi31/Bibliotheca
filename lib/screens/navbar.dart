import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:library_management/screens/homepage.dart';
import 'package:library_management/users/authentication/login_page.dart';
import '../users/authentication/auth.dart';
import 'NavBar/subscriptions.dart';
import 'NavBar/yourprofile.dart';

class NavBar extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Color(0xFF303F9F),
      backgroundColor: Color(0xFFAAD9FF),
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("User Name"),
            accountEmail: Text("user@email.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/image_6.png'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Your Profile'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
              // Navigate to your profile screen
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('History'),
            onTap: () {
              // Navigate to your orders screen
            },
          ),
          ListTile(
            leading: Icon(Icons.subscriptions),
            title: Text('Subscriptions'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SubscriptionPage()));
              // Navigate to subscriptions screen
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirm Log Out'),
                    content: Text('Are you sure you want to log out?'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Yes'),
                        onPressed: () {
                          _signOut(context);
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
