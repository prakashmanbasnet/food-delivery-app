import 'package:flutter/material.dart';
import 'package:foodapp/constant/constant.dart';

class Paymentpage extends StatefulWidget {
  

  @override
  _PaymentpageState createState() => _PaymentpageState();
}

class _PaymentpageState extends State<Paymentpage> {
  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 40),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Payment',
                  style: TextStyle(fontSize: 34),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Payment method',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: deviceHeight * 0.25,
                  width: deviceWidth * 0.80,
                  //margin: EdgeInsets.only(left: 20),

                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(children: [
                            Icon(Icons.add_a_photo),
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              'assets/image/visa.png',
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Card')
                          ]),
                          Divider(
                            color: Colors.black,
                          ),
                          Row(children: [
                            Icon(Icons.add_a_photo),
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              'assets/image/visa.png',
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Card')
                          ]),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Delivery method',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: deviceHeight * 0.20,
                  width: deviceWidth * 0.80,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.add_alert),
                              SizedBox(
                                width: 20,
                              ),
                              Text('Door delivery'),
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Row(
                            children: [
                              Icon(Icons.add_alert),
                              SizedBox(
                                width: 20,
                              ),
                              Text('Door delivery'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
               // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(width: 200,),
                  Text(
                    '23,000',
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              SizedBox(height: 20,),
                 
                Container(
                margin: EdgeInsets.only(right: 35),
                  //width: deviceWidth*0.80,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.deepOrange),
                  child: Center(
                    child: Text(
                      'Proceed to payment',
                      style: TextStyle(
                        color: Color2,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
