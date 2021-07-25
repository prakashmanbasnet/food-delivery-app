import 'package:flutter/material.dart';
import 'package:foodapp/constant/constant.dart';
import '../customClass/cateogoryClass.dart';

class SearchPage extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(onPressed: () {}, icon: Icon(Icons.clear))];
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    //final Null result=null;
    return IconButton(
      onPressed: () {
        close(context, 'null');
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: foodContainer.length
      ,itemBuilder: (context,int index){
           return  Column(
      children: [
        Row(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, left: 20),
                  height: deviceHeight * 0.30,
                  width: deviceWidth * 0.35,
                  decoration: BoxDecoration(
                    color: Color2,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top:150,left: 10),
                    child: Text(foodContainer[index]['foodName']),
                  ),
                ),
                Image.asset(
                  foodContainer[index]['foodImage'],
                  height: 180,
                  width: 180,
                ),
              ],
            ),
              Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, left: 20),
                  height: deviceHeight * 0.30,
                  width: deviceWidth * 0.35,
                  decoration: BoxDecoration(
                    color: Color2,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top:150,left: 10),
                    child: Text(foodContainer[index]['foodName1']),
                  ),
                ),
                Image.asset(
                  foodContainer[index]['foodImage1'],
                  height: 180,
                  width: 180,
                ),
              ],
            ),
      ],
    ),
      ]
           );

    });
    throw UnimplementedError();
  }
}
