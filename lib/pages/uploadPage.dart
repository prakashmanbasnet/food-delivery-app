import 'package:flutter/material.dart';
import 'package:foodapp/constant/constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<String> foodType = ['Food', 'Snack', 'Drink'];

class UploadFoodImage extends StatefulWidget {
  @override
  _UploadFoodImageState createState() => _UploadFoodImageState();
}

class _UploadFoodImageState extends State<UploadFoodImage> {
  final TextEditingController foodNameController = TextEditingController();
  final TextEditingController foodPriceController = TextEditingController();

  File? imageFile;
  var uploadImageUrl;
  final picker = ImagePicker();
  UploadTask? uploadTask;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var character = foodType[0];

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }

  Future uploadImageToFirebase(photo) async {
    if (photo == null) return;

    String fileName = basename(photo!.path);
    Reference firbaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    UploadTask uploadTask = firbaseStorageRef.putFile(photo!);

    TaskSnapshot taskSnapshot = await uploadTask;
    var uploadImageUrl = await taskSnapshot.ref.getDownloadURL();

    return uploadImageUrl;
  }

  CollectionReference food = FirebaseFirestore.instance.collection('food');
  CollectionReference snack = FirebaseFirestore.instance.collection('snack');
  CollectionReference drink = FirebaseFirestore.instance.collection('drink');

  bool isLoading = false;

  Future addFoodDetailsToFirebase(context) async {
    setState(() {
      isLoading = true;
    });

    String foodName = foodNameController.text;
    String foodPrice = foodPriceController.text;

    try {
        String uploadImageUrl = await uploadImageToFirebase(imageFile);

        if (character == 'Food' &&
            foodName != null &&
            foodPrice != null &&
            uploadImageUrl != null) {
          await food.add({
            'foodName': foodName,
            'foodPrice': foodPrice,
            'foodTypes': character,
            'foodImageurl': uploadImageUrl
          });
          setState(() {
            isLoading = false;
          });
          showCompleteSnackBar(context);
        } else if (character == 'Snack' &&
            foodName != null &&
            foodPrice != null &&
            uploadImageUrl != null) {
          await snack.add({
            'foodName': foodName,
            'foodPrice': foodPrice,
            'foodTypes': character,
            'foodImageurl': uploadImageUrl
          });
          setState(() {
            isLoading = false;
          });
          showCompleteSnackBar(context);
        } else if (character == 'Drink' &&
            foodName != null &&
            foodPrice != null &&
            uploadImageUrl != null) {
          await drink.add({
            'foodName': foodName,
            'foodPrice': foodPrice,
            'foodTypes': character,
            'foodImageurl': uploadImageUrl
          });
          setState(() {
            isLoading = false;
          });
          showCompleteSnackBar(context);
        } else {
          setState(() {
            isLoading = false;
          });
          showErrorSnackBar(context);
        }
      
    } catch (e) {
      print(e);
    }
    setState(() {
      isLoading = false;
    });
  }

  void showErrorSnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('please fill all the form'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showCompleteSnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('data uploaded to database'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    var fileName =
        imageFile != null ? basename(imageFile!.path) : 'No file selected';
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Center(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon:Icon(Icons.arrow_back)),
                  ),
                  IconButton(
                    onPressed: pickImage,
                    icon: Icon(
                      Icons.attach_file,
                      size: 50,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(fileName),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Text('Food'),
                    leading: Radio(
                      value: foodType[0],
                      groupValue: character,
                      onChanged: (value) {
                        setState(() {
                          character = value!.toString();
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('Snack'),
                    leading: Radio(
                      value: foodType[1],
                      groupValue: character,
                      onChanged: (value) {
                        setState(() {
                          character = value!.toString();
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('Drink'),
                    leading: Radio(
                      value: foodType[2],
                      groupValue: character,
                      onChanged: (value) {
                        setState(() {
                          character = value!.toString();
                        });
                      },
                    ),
                  ),
                  TextFormField(
                    controller: foodNameController,
                    decoration:
                        const InputDecoration(hintText: 'Enter your food name'),
                  ),
                  TextFormField(
                    controller: foodPriceController,
                    decoration: InputDecoration(
                      hintText: 'Enter price of the food',
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  if (isLoading) CircularProgressIndicator(),
                  if (!isLoading)
                    GestureDetector(
                      onTap: () async {
                        await addFoodDetailsToFirebase(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 35),
                        //width: deviceWidth*0.80,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.deepOrange),
                        child: Center(
                          child: Text(
                            'Submit',
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
          ),
        ),
      ),
    );
  }
}
