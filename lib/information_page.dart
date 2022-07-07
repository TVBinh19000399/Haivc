import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ListComments extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListCommentsState();
  }
}

class _ListCommentsState extends State<ListComments> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
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
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //chatting frame
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(16, 16, 16, 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //sample line of chats
                    LineOfFriendsChat(),
                    LineOfMyChat(),
                    LineOfFriendsChat(),
                    LineOfFriendsChat(),
                    LineOfFriendsChat(),
                    LineOfMyChat(),
                    LineOfFriendsChat(),
                    LineOfFriendsChat(),
                    LineOfFriendsChat(),
                    LineOfFriendsChat(),
                    LineOfFriendsChat(),
                    LineOfFriendsChat(),
                    LineOfMyChat(),
                    LineOfFriendsChat(),
                    LineOfFriendsChat(),
                    LineOfFriendsChat(),
                    LineOfMyChat(),
                  ],
                ),
              ),
            ),
          ),
          //typing frame
          Container(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  //bottom items
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.camera_alt),
                      onPressed: () {
                        print("ban vua an vao camera");
                        pickImage();
                      },
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.attach_file_sharp),
                      onPressed: () {
                        print("ban vua an vao select file");
                      },
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.tag_faces),
                      onPressed: () {
                        print("ban vua an vao icon face");
                      },
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Viet tin nhan...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    flex: 7,
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        print("ban vua an vao send");
                      },
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LineOfFriendsChat extends StatelessWidget {
  String messege = "This is my messege!";

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Name_1",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTiXjldHhFIVdvZDCeoq6sSzSzxg95OvLCxQ&usqp=CAU"),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.orange,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(15))),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      messege,
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Text("16:30"),
              ],
            ),
            SizedBox(
              height: 7,
            ),
          ],
        ));
  }
}

class LineOfMyChat extends StatelessWidget {
  String messege = "OK!";

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("16:30"),
            SizedBox(
              width: 12,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.orange,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(20))),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  messege,
                  textDirection: TextDirection.ltr,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSQo_rfcDCwqgttOC87yGZ31tdA_Ek1n0Dm3Cfc4PmoSD83Z9R3v0kWy1tGnkaTEZwSwk&usqp=CAU"),
            ),
          ],
        ));
  }
}
