import 'package:flutter/material.dart';
import 'package:foodapp/constant/constant.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:foodapp/customClass/cateogoryClass.dart';

class FoodDetailsPage extends StatefulWidget {
  @override
  _FoodDetailsPageState createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color1,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline))
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 35),
         width: deviceWidth * 0.80,
          child: Column(
            children: [

              Swiper(
                 itemCount: foodContainer.length,
              
                 itemBuilder: (context,int index){
                   return Image.asset(
                    foodContainer[index]['foodImage1'],
                  
                   );
                 },
                 itemHeight: deviceHeight*0.30,
                 itemWidth: deviceWidth*0.50,
                 layout: SwiperLayout.TINDER,
                   scale: 0.9,
                // control: SwiperControl(),
              // pagination: SwiperPagination(),
                
              ),
              Text(
                'Veggie  mix',
                style: TextStyle(fontSize: 28),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'N1,900',
                style: TextStyle(color: Color3, fontSize: 22),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Delivery info',
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 17,
                  ),
                ),
              ),
              Text(
                'Delivered between monday aug and thursday 20 from 8 pm to 91:32 pm',
                style: TextStyle(color: Colors.black38, fontSize: 15),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Return policy',
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 17,
                  ),
                ),
              ),
              Text(
                'All our foods are double checked'
                'before leaving our stores so by any case'
                'you found broken food please contact our hotline immediately',
                style: TextStyle(color: Colors.black38, fontSize: 15),
              ),
              SizedBox(
                height: 45,
              ),
              Container(
                width: double.infinity,
                height: 60,
                decoration:
                BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.deepOrange
                  ),
                child: Center(
                  child: Text('Add to cart',
                  style: TextStyle(
                    color: Color2,
                    fontSize: 17,
                  ),
                  ),),

              ),
            ], 
              )
          
          ),
        ),
      );
   
  }
}
