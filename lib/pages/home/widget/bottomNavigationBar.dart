 import 'package:flutter/material.dart';

 BottomNavigationBar bottomNavigationBar(BuildContext context) {
   int currentindex=0;
    return BottomNavigationBar(
      currentIndex: currentindex,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/home');

            break;
          case 1:
            Navigator.pushNamed(context, "/profile");
        }
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.deepOrange,
          ),
          label: '',
          //backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
            color: Colors.deepOrange,
          ),
          label: '',
        ),
      ],
    );
  }