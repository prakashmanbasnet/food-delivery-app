

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const EMAIL='email';
  static const USERNAME='username';
  static const PASSWORD='password';
  //static const CART='cart';

 String email;
 String username;
   String password;
  
  UserModel({ this.email, this.username, this.password});

  UserModel.fromSnapshot(DocumentSnapshot snapshot){
      email=snapshot[EMAIL];
      username=snapshot[username];
      password=snapshot[PASSWORD];
  }
}