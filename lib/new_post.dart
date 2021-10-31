import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewPost extends StatefulWidget{
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost>{

  /* ? -> can be nullable
     ! -> cant be null
   */

  File? _image;
  final picker= ImagePicker();

 Future getImageFile(ImageSource src) async{

    //picking from gallery
    final pickedFile = await picker.getImage(source: src);
    setState(() {
      if(pickedFile != null){
        _image= File(pickedFile.path);
      }else{
        print('No image selected');
      }
    });

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: _image == null
            ? Text("No Image selected")
            : Image.file(
          _image!,
          height: 200,
          width: 200,
        ),
      ),
      floatingActionButton:Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton.extended(
            label: Text("Camera"),
            onPressed: () => {getImageFile(ImageSource.camera),},//getImageFile(ImageSource.camera),
            heroTag: UniqueKey(),
            icon: Icon(Icons.camera),
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton.extended(
            label: Text("Gallery"),
            onPressed: () => {getImageFile(ImageSource.gallery),},//getImageFile(ImageSource.gallery),
            heroTag: UniqueKey(),
            icon: Icon(Icons.photo_library),
          )
        ],
      ),
    );
  }
}