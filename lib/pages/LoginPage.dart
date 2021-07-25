import 'package:flutter/material.dart';
import '../pages/loginForm.dart';


class LoginPage extends StatefulWidget {
 
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin=true;
  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: deviceHeight,
          color: Color(0xfff2f2f2),
          child: Column(
            children: [
              SizedBox(
                height: deviceHeight / 2.3,
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  color: Color(0xffffffff),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Center(
                        child: Image.asset('assets/image/loginicon.png'),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 70,
                        child: GestureDetector(
                          onTap: (){
                               setState(() {
                                 isLogin=!isLogin;
                               });
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto',
                                fontSize: 18),
                          ),
                        ),
                      ),
                      if(isLogin)
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 5,
                        width: deviceWidth*0.35,
                        decoration: BoxDecoration(color: Colors.deepOrange),
                      ),
                      Positioned(
                        right: 70,
                        bottom: 20,
                        child: GestureDetector(
                          onTap: (){
                             setState(() {
                               isLogin=!isLogin;
                             });
                          },
                          child: Text(
                            'Sign-up',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto',
                                fontSize: 18),
                          ),
                        ),
                      ),
                    if(!isLogin)
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                          height: 5,
                          width: deviceWidth*0.35,
                          decoration: BoxDecoration(color: Colors.deepOrange),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              LoginForm(
                loginSignup:(value){
                  setState(() {
                    isLogin=value;
                    print(isLogin);
                  });
                },
                isLogin: isLogin,),
            ],
          ),
        ),
      ),
    );
  }
}


   
 