import 'package:flutter/material.dart';
import 'package:foodapp/customClass/cateogoryClass.dart';
import 'package:foodapp/pages/SearchPage.dart';
import 'package:foodapp/pages/profilePage.dart';
import '../pages/profilePage.dart';
import '../method/foodContainerHome.dart';
import '../method/bottomNavigationBar.dart';
import '../pages/SearchPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool foodSelected = true;
  bool drinkSelected = true;
  bool snackSelected = true;

  int _selectedIndex = 0;
  _selectedindex(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Image.asset(
              'assets/image/menu.png',
              width: 25,
            ),
            iconSize: 100,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          height: deviceHeight,
          width: deviceWidth * 0.80,
          color: Color(0xfff2f2f2),
          child: Column(
            children: [
              Container(
                height: deviceHeight * 0.15,
                child: DrawerHeader(
                  child: Center(child: Text('prakashman')),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: deviceHeight * 0.20,
                width: deviceWidth,
                child: Card(
                  color: Color(0xffffffff),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/image/don.png',
                              height: 50,
                              width: 50,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, left: 8),
                            child: Column(
                              children: [
                                Text(
                                  'Prakash Man Basnet',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'manbasnet001@gmail.com',
                                    style: TextStyle(color: Colors.black38),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'kathamndu,nepal street 32',
                                    style: TextStyle(color: Colors.black38),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 10),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Payment Method',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/upload');
                },
                child: Text(
                  'Add food menu',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                primary: Colors.deepOrange
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 20.0),
                child: Text(
                  'Delicious',
                  style: TextStyle(
                      fontSize: 34,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'food for you',
                  style: TextStyle(
                      fontSize: 34,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              height: deviceHeight * 0.10,
              width: deviceWidth * 0.80,
              decoration: BoxDecoration(
                  color: Color(0xffefeeee),
                  borderRadius: BorderRadius.circular(20)),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          showSearch(context: context, delegate: SearchPage());
                        },
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  //SizedBox(width: 70,),

                  Padding(
                    padding: const EdgeInsets.only(left: 60.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none, labelText: 'Search'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              // color: Colors.blue,
              //padding: EdgeInsets.only(top: 10),
              height: 40,
              width: deviceWidth * 0.80,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodCategory.length,
                  itemBuilder: (context, int index) {
                    return Row(
                      children: [
                        Container(
                          height: 70,
                          width: 90,
                          child: Column(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedindex(index);
                                    });
                                  },
                                  child: Text(foodCategory[index]['itemName'])),
                              SizedBox(
                                height: 7,
                              ),
                              if (_selectedIndex != null &&
                                  _selectedIndex == index)
                                Container(
                                  height: 3,
                                  width: 70,
                                  decoration:
                                      BoxDecoration(color: Colors.deepOrange),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                      ],
                    );
                  }),
            ),
            foodContainerHomePage(deviceHeight, deviceWidth)
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }
}
