import 'package:foodapp/constant/firebase.dart';
import 'package:foodapp/model/food.dart';
import 'package:get/get.dart';
import 'dart:async';

class FoodController extends GetxController {
  
  static FoodController instance = Get.find();
  RxList<FoodModel> foods = RxList<FoodModel>([]);
  String collection = 'food';

  @override
  void onReady() {
    super.onReady();
    foods.bindStream(getAllFoods());
  }

  Stream<List<FoodModel>> getAllFoods()=>
     firebaseFirestore.collection(collection).snapshots().map((query) =>
        query.docs.map((item) => FoodModel.fromMap(item.data())).toList());
  
}
