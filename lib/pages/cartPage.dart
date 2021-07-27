import 'package:flutter/material.dart';
import 'package:foodapp/constant/constant.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var itemNumber = 5;

  void addFoodNumber() {
    itemNumber = itemNumber + 1;
  }

  void subtractFoodNumber() {
    itemNumber = itemNumber - 1;
  }

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
          title: Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Text('Cart'),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          height: deviceHeight,
          width: deviceWidth,
          child: SingleChildScrollView(
            // physics: ScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text('Swipe to delete the added item'),
                  ),
                ),
                ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    //scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, int index) {
                      return Card(
                        child: ListTile(
                          leading: Image.asset(
                            'assets/image/food1.png',
                            width: 50,
                            height: 50,
                          ),
                          title: Text('Momo'),
                          subtitle: Text('Price'),
                          trailing: Container(
                            // padding: EdgeInsets.all(0),
                            height: 30,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      subtractFoodNumber();
                                    });
                                  },
                                  child: Container(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    itemNumber.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      addFoodNumber();
                                    });
                                  },
                                  child: Container(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/payment');
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 280),
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.deepOrange),
                    child: Center(
                      child: Text(
                        'Complete order',
                        style: TextStyle(
                          color: Color2,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
