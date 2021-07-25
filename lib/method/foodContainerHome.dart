   import 'package:flutter/material.dart';
   import '../customClass/cateogoryClass.dart';
  

  Container foodContainerHomePage(double deviceHeight, double deviceWidth) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: deviceHeight * 0.40,
      width: deviceWidth * 0.80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: foodContainer.length,
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
                    onTap: (){
                       Navigator.pushNamed(context, '/foodDetails');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Image.asset(
                        foodContainer[index]['foodImage'],
                        //fit: BoxFit.contain,
                        height: 180,
                        width: 130,
                      ),
                    ),
                  ),
                  Text(
                    foodContainer[index]['foodName'],
                    style: TextStyle(color: Colors.black87),
                  ),
                  Text(
                    foodContainer[index]['Price'].toString(),
                    style: TextStyle(color: Colors.black87),
                  )
                ],
              ),
            );
          }),
    );
  }