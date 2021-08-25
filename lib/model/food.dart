

class FoodModel{
  static const NAME='name';
  static const PRICE='price';
  static const TYPE='type';
  static const IMAGE='image';

  String name;
  String price;
  String type;
  String image;
  

  FoodModel({ this.name,this.price,this.type,this.image});

  FoodModel.fromMap(Map<String,dynamic> data){
       name=data[NAME];
       price=data[PRICE];
       type=data[TYPE];
       image=data[IMAGE];
      

}
}