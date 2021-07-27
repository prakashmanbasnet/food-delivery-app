//import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'dart:io';
// import 'package:path/path.dart';


// class UploadFoodImage extends StatefulWidget {
 

//   @override
//   _UploadFoodImageState createState() => _UploadFoodImageState();
// }

// class _UploadFoodImageState extends State<UploadFoodImage> {
//   late File imageFile; 
//   final picker=ImagePicker();

// Future pickImage()async{
//    final pickedFile=await picker.pickImage(source: ImageSource.gallery);
//    setState(() {
//      imageFile=File(pickedFile!.path);
//    });
// }

// Future uploadImageToFirebase(BuildContext context) async{
// String fileName=basename(imageFile.path);
// Reference firbaseStorageRef=FirebaseStorage.instance.ref().child('uploads/$fileName');
// UploadTask  uploadTask=firbaseStorageRef.putFile(imageFile);
// TaskSnapshot taskSnapshot=await uploadTask;
// taskSnapshot.ref.getDownloadURL().then((value) => print('Done:$value'));
// }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }