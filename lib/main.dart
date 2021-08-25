import 'package:flutter/material.dart';
import 'package:foodapp/controller/authController.dart';
import 'package:foodapp/pages/home/HomePage.dart';
import 'package:foodapp/utilis/LoadingPage.dart';
import 'package:foodapp/pages/cartPage.dart';
import 'package:foodapp/pages/paymentPage.dart';
import 'package:foodapp/pages/home/profilePage.dart';
import 'package:foodapp/pages/home/uploadPage.dart';
import 'package:get/get.dart';

import 'constant/firebase.dart';
import 'controller/foodController.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(FoodController());
    Get.put(AuthController());
  });
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:  Color(0xfff2f2f2),
        scaffoldBackgroundColor: Color(0xfff2f2f2),
      ),
      home:LoadingPage(),
      
      routes: {
         '/home':(context)=>HomePage(),
         '/profile':(context)=>Profilepage(),
         //'/foodDetails':(context)=>FoodDetailsPage(),
         '/cartPage':(context)=>CartPage(),
         '/payment':(context)=>Paymentpage(),
         '/upload':(context)=>UploadFoodImage(),
        
      },
    );
  }
}