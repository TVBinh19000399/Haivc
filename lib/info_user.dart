import 'package:flutter/material.dart';

class UserInfos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text("Info of user"),
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 20, right: 20),
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTiXjldHhFIVdvZDCeoq6sSzSzxg95OvLCxQ&usqp=CAU'),
            ),
            Center(
              child: Text("MY_NAME",
                  style: TextStyle(fontSize: 30, color: Colors.orange)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Liked",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("13"),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Followed",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("14"),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Friends",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("15"),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                )),
              ],
            ),
            Divider(
              color: Colors.orange,
            ),
            ListTile(
              title: Text(
                "My_name",
              ),
              leading: Icon(Icons.person),
              trailing: IconButton(
                icon: Icon(Icons.drive_file_rename_outline_rounded),
                onPressed: () {
                  print("Ban vua bam vao rename");
                },
              ),
            ),
            ListTile(
                title: Text("My_email"),
                leading: Icon(Icons.mail),
                trailing: IconButton(
                  icon: Icon(Icons.drive_file_rename_outline_rounded),
                  onPressed: () {
                    print("Ban vua bam vao doi email");
                  },
                )),
            ListTile(
                title: Text("My_phone"),
                leading: Icon(Icons.phone),
                trailing: IconButton(
                  icon: Icon(Icons.drive_file_rename_outline_rounded),
                  onPressed: () {
                    print("Ban vua bam vao doi sdt");
                  },
                )),
            ListTile(
                title: Text("My_facebook"),
                leading: Icon(Icons.facebook),
                trailing: IconButton(
                  icon: Icon(Icons.drive_file_rename_outline_rounded),
                  onPressed: () {
                    print("Ban vua bam vao doi dia chi facebook");
                  },
                )),
          ],
        ));
  }
}

// Image.network(
// 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTiXjldHhFIVdvZDCeoq6sSzSzxg95OvLCxQ&usqp=CAU')
