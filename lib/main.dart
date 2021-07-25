import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/pages/SearchPage.dart';
import '../pages/LoginPage.dart';
import '../pages/HomePage.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import '../pages/profilePage.dart';
 import '../pages/FoodDetailsPage.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await firebase_core.Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:  Color(0xfff2f2f2),
        scaffoldBackgroundColor: Color(0xfff2f2f2),
      ),
      home:LoginPage(),
      
      routes: {
         '/home':(context)=>HomePage(),
         '/profile':(context)=>Profilepage(),
         '/foodDetails':(context)=>FoodDetailsPage(),
        
      },
    );
  }
}