import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAAD9FF),
      appBar: AppBar(
        backgroundColor: Color(0xFF303F9F),
        title: Text('Your Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        children: [
          Center(
            child: Stack(
              children: [
                Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue,
                      width: 5.0,
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/330px-Image_created_with_a_mobile_phone.png'),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () {
                      // TODO: Implement edit profile picture functionality.
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Your Name'),
            trailing: IconButton(
              icon: Icon(Icons.edit, size: 20.0),
              onPressed: () {
                // TODO: Implement edit profile name functionality.
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone Number'),
            trailing: IconButton(
              icon: Icon(Icons.edit, size: 20.0),
              onPressed: () {
                // TODO: Implement edit profile name functionality.
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.email_outlined),
            title: Text('Email'),
            trailing: IconButton(
              icon: Icon(Icons.edit, size: 20.0),
              onPressed: () {
                // TODO: Implement edit profile name functionality.
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.password),
            title: Text('Password'),
            trailing: IconButton(
              icon: Icon(Icons.edit, size: 20.0),
              onPressed: () {
                // TODO: Implement edit profile name functionality.
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Wishlist'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // TODO: Implement wishlist functionality.
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help Center'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // TODO: Implement help center functionality.
            },
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Terms, Policies and Licenses'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // TODO: Implement terms and policies functionality.
            },
          ),
        ],
      ),
    );
  }
}
