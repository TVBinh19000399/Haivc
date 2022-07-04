import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final author = "@Author_name";
  File? image;
  final titleController = TextEditingController();

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print("Khong the chon hinh anh");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(author),
              ElevatedButton(
                onPressed: () {
                  print("Ban vua an nut tim hinh anh");
                  pickImage();
                },
                child: Text("Find image"),
              ),
              image != null
                  ? Image.file(image!)
                  : IconButton(
                      icon: Image.network(
                          'https://kravmaganewcastle.com.au/wp-content/uploads/2017/04/default-image-620x600.jpg'),
                      iconSize: 300,
                      onPressed: () {
                        print("Ban vau bam vao doi hinh anh");
                        pickImage();
                      },
                    ),
              Text("Tieu de:"),
              TextField(
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print("Ban vua an nut clear");
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Background color
                    ),
                    child: Text("clear"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          builder: (contex) => Container(
                                padding: EdgeInsets.all(16),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      FlutterLogo(
                                        size: 120,
                                      ),
                                      FlutterLogo(
                                        size: 120,
                                      ),
                                      FlutterLogo(
                                        size: 120,
                                      ),
                                      FlutterLogo(
                                        size: 120,
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                    },
                    child: Text("Doc quy dinh"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange, // Background color
                    ),
                    onPressed: () {
                      print("Ban vua an nut upload va show snackbar!");
                      showErrorSnackBar(context);
                    },
                    child: Text(
                      "Upload",
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showErrorSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.error_outline, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              'This is a error message',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.fixed,
    );
    //snackbar khong hien thi
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
