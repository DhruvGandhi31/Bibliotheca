import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';

import 'login_page.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[400],
      child: Center(
        child: SpinKitFadingCircle(
          color: Colors.blue[900],
          size: 50,
          duration: Duration(seconds: 6),
        ),
      ),
    );
  }
}
