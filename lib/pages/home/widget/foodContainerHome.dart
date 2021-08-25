
import 'package:flutter/material.dart';
import 'package:foodapp/constant/controllers.dart';
import 'package:foodapp/pages/FoodDetailsPage.dart';
import 'package:get/get.dart';


Container foodContainerHomePage(double deviceHeight, double deviceWidth) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    height: deviceHeight * 0.40,
    width: deviceWidth * 0.80,
    child: Obx((){
          return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodController.foods.length,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context){
                                return FoodDetailsPage(index:index,docs:foodController.foods[index]);
                              }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child:Image.network(
                             foodController.foods[index].image,
                              //fit: BoxFit.contain,
                              height: deviceHeight * 0.25,
                              width: deviceHeight * 0.20,
                            ),
                          ),
                        ),
                        Text(
                         foodController.foods[index].name,
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
                               foodController.foods[index].price,
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
    }) 
        
  );
}
