import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';


// ignore: must_be_immutable
class LoginForm extends StatefulWidget {
  Function(bool isLogin) loginSignup;
  LoginForm({required this.isLogin, required this.loginSignup});
  bool isLogin;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  TextEditingController emailcontroller=TextEditingController();
  TextEditingController usernamecontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  final formkey = GlobalKey<FormState>();
  final auth=FirebaseAuth.instance;
  String email = '';
  String username = '';
  String password = '';

  dynamic trySubmit() {
    if (formkey.currentState != null) {
      final isValid = formkey.currentState!.validate();
       FocusScope.of(context).unfocus();
      if (isValid) {
        formkey.currentState!.save();
        submitButton(email.trim(),username.trim(),password.trim());
         
      }
    }
   
  }
  
  
  void submitButton(email,username,password)async{
    try{
       UserCredential authResult;
    if(widget.isLogin){
       authResult=await auth.signInWithEmailAndPassword(email: email, password: password);
    }else{
      authResult=await auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    Navigator.pushNamed(context, '/home');
    } catch(e){
       showDialog(context: context,
        builder: (BuildContext ctc){
          return AlertDialog(
            title: Text('Error'),
            content: Text(e.toString()),
          );
        });
      
       
    }
      emailcontroller.clear();
         passwordcontroller.clear();
         usernamecontroller.clear();
    }
   
  



  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Material(
        child: Container(
            color: Color(0xfff2f2f2),
            height: deviceHeight * 0.50,
            width: deviceWidth * 0.80,
            child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
           
              TextFormField(
                controller: emailcontroller,
                  key: ValueKey('email'),
                validator: (value){
                  if(value!.isEmpty||!value.contains("@")){
                    return 'Enter valid email address';
                }
                return null;
                },
                onSaved: (value){
                  if(value!=null)
                  email=value;
                },
                decoration: InputDecoration(
                    labelText: 'Email Adress',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87))),
              ),
                 if(!widget.isLogin)
              TextFormField(
                controller: usernamecontroller,
                key: ValueKey('username'),
                validator: (value){
                  if(value!=null){
                    if(value.isEmpty||value.length<5){
                      return 'Please enter username of more length';
                  }
                }
                return null;
                },
                onSaved: (value){
                  username=value!;
                },
                decoration: InputDecoration(
                    labelText: 'Username',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87))),
              ),
              TextFormField(
                controller: passwordcontroller,
                  key: ValueKey('password'),
                  validator: (value){
                  if(value!=null){
                    if(value.isEmpty||value.length<5){
                      return ' enter password of more than 5 character';
                  }
                }
                return null;
                },
                onSaved: (value){
                  password=value!;
                },
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87))),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Forgot passcode ?',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Color(0xfffa4a0c)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: trySubmit,
                   
                  style: ElevatedButton.styleFrom(primary: Colors.deepOrange),
                  child: Text(widget.isLogin ? 'Login' : 'sign-up'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.isLogin = !widget.isLogin;
                    widget.loginSignup(widget.isLogin);
                  });
                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    widget.isLogin
                        ? 'Create a new account'
                        : 'i already have account',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Color(0xfffa4a0c)),
                  ),
                ),
              ),
            ],
          ),
        ),
            ),
          ));
  }
}
