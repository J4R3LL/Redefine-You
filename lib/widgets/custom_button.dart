import 'package:flutter/material.dart';
import './custom_pageroute.dart';
import '../screens/home_screen.dart';
import '../screens/inbox.dart';
import '../screens/social.dart';
import '../screens/account.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class bottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
         child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home_filled),
              onPressed: () {
                 Navigator.pushReplacement(
                  context,
                  CustomPageRouteBuilder(child: homeScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.message_rounded),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  CustomPageRouteBuilder(child: socialScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.inbox_rounded),
              onPressed: () {
               Navigator.pushReplacement(
                  context,
                  CustomPageRouteBuilder(child: inboxScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.account_box_rounded),
              onPressed: () {
               Navigator.pushReplacement(
                  context,
                  CustomPageRouteBuilder(child: accountScreen()),
                );
              },
            ),
          ],
        ),
      );
  }
}
