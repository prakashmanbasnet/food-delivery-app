import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../customClass/cateogoryClass.dart';

Container foodContainerHomePage(double deviceHeight, double deviceWidth) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    height: deviceHeight * 0.40,
    width: deviceWidth * 0.80,
    child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('food').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error=${snapshot.error}');
          }

          if (snapshot.hasData) {
            final docs = snapshot.data!.docs;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: docs.length,
                itemBuilder: (context, int index) {
                  return Container(
                    width: deviceWidth * 0.40,
                    margin: EdgeInsets.only(left: 10, right: 20),
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/foodDetails');
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Image.network(
                              docs[index]['foodImageurl'],
                              //fit: BoxFit.contain,
                              height: deviceHeight * 0.25,
                              width: deviceHeight * 0.20,
                            ),
                          ),
                        ),
                        Text(
                          docs[index]['foodName'],
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          //color: Colors.indigoAccent,
                          margin: EdgeInsets.only(left: 40),
                          child: Row(
                            children: [
                              Text(
                                'Price:',
                                style: TextStyle(color: Colors.black87),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                docs[index]['foodPrice'].toString(),
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                });
          }
          return Text('hello');
        }),
  );
}
