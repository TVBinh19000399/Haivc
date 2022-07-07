import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textcontroller = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.reference();
  // DatabaseReference databaseRef = FirebaseDatabase.instance.ref("users/123");
  // DatabaseReference databaseRef = FirebaseDatabase.instance.ref("https://haivc-5e7ca-default-rtdb.asia-southeast1.firebasedatabase.app");
  final Future<FirebaseApp> _future = Firebase.initializeApp();

  void addData() async {
    await databaseRef.set({
      "name": "John",
      "age": 18,
      "address": {
        "line1": "100 Mountain View"
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Demo"),
      ),
      body: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 250.0),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextField(
                          controller: textcontroller,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Center(
                          child: RaisedButton(
                              color: Colors.pinkAccent,
                              child: Text("Save to Database"),
                              onPressed: () {
                                print("dong chu vua nhap: "+textcontroller.text);
                                addData();
                                //call method flutter upload
                              })),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
