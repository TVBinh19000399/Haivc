import 'package:flutter/material.dart';

class ListComments extends StatelessWidget {
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
                    child: Icon(Icons.camera_alt),
                    flex: 1,
                  ),
                  Expanded(
                    child: Icon(Icons.face),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
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
                    child: Icon(Icons.send),
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
