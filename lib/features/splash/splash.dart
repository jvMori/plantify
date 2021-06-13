import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantify/common/colors.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 1],
          colors: [
            primaryColor.withOpacity(0.7),
            primaryColor.withOpacity(1),
          ],
        )),
        child: SafeArea(
          child: Column(
            children: [Text('hello')],
          ),
        ),
      ),
    );
  }
}
