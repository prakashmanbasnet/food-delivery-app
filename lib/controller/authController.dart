import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/constant/firebase.dart';
import 'package:foodapp/model/user.dart';
import 'package:foodapp/pages/home/HomePage.dart';
import 'package:foodapp/pages/authentication/LoginPage.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rx<User> firebaseUser;
  String userCollection = 'users';
  Rx<UserModel> userModel = UserModel().obs;

  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onReady() {
    firebaseUser = Rx<User>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User user) {
    if (user == null) {
      Get.offAll(() => HomePage());
    } else {
      userModel.bindStream(listenToUser());
      Get.offAll(() => HomePage());
    }
  }

  void signIn(){
    try{
       auth.signInWithEmailAndPassword(
      email: email.text.trim(),
       password: password.text.trim())
       .then((result) {
         _clearController();
       });

    }catch(e){
             var error=e.toString();
             print(error);
             Get.snackbar('Failed to Login', 'Try again'); 
    }
   
  }

  void signUp() {
    try{
       auth.createUserWithEmailAndPassword(
      email: email.text.trim(),
      password: password.text.trim()).then(
        (result) {

          String _userId=result.user.uid;
          _addUserToFirestore(_userId);
          _clearController();

        });

    }catch(e){
           var error=e.toString();  
           Get.snackbar('Sign In Failed', 'Try again');
           print(error);  
    }
   
  }

  _addUserToFirestore(String userId){
    firebaseFirestore.collection(userCollection)
    .doc(userId).set({
      'name':username.text.trim(),
      'email':email.text.trim(),
      'id':userId,
    });
  }

  _clearController(){
    username.clear();
    email.clear();
    password.clear();
  }

  Stream<UserModel> listenToUser() => firebaseFirestore
      .collection(userCollection)
      .doc(firebaseUser.value.uid)
      .snapshots()
      .map((snapshot) => UserModel.fromSnapshot(snapshot));
}
