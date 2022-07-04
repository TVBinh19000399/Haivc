import 'package:flutter/material.dart';
import 'package:haivc/upload_page.dart';
import 'baidang_item.dart';
import 'news_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'setting_page.dart';
import 'information_page.dart';
import 'info_user.dart';
import 'main.dart';
import 'login_page.dart';

final cruser = FirebaseAuth.instance.currentUser;

class PageChanging extends StatefulWidget {
  @override
  _PageChangingState createState() => _PageChangingState();
}

class _PageChangingState extends State<PageChanging> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    ListNews(),
    ListComments(),
    UploadPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HAIVC'),
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
              onPressed: () {
                print("Ban vua bam vao search!");
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Communicate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload_file),
            label: 'Post',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        onTap: _onItemTapped,
      ),
      drawer: NavigationDrawer(),
    );
  }
}

bool isLogined = true;

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              isLogined
                  ?
                  //kiem tra dang nhap hay chua
                  buildHeaderLogined(context)
                  : buildHeaderUnlogined(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  //chua dang nhap
  Widget buildHeaderUnlogined(BuildContext context) => Material(
        color: Colors.orange,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => UserInfos()));
          },
          child: Container(
            padding: EdgeInsets.only(
                top: 12 + MediaQuery.of(context).padding.top, bottom: 12),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 52,
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTiXjldHhFIVdvZDCeoq6sSzSzxg95OvLCxQ&usqp=CAU"),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Unknown name',
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
                Text(
                  "No email!",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      );

  //da dang nhap
  Widget buildHeaderLogined(BuildContext context) => Material(
        color: Colors.orange,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => UserInfos()));
          },
          child: Container(
            padding: EdgeInsets.only(
                top: 12 + MediaQuery.of(context).padding.top, bottom: 12),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 52,
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSQo_rfcDCwqgttOC87yGZ31tdA_Ek1n0Dm3Cfc4PmoSD83Z9R3v0kWy1tGnkaTEZwSwk&usqp=CAU"),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Binh dz',
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
                Text(
                  cruser?.email != null
                      ? (cruser?.email).toString()
                      : "no email!",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: EdgeInsets.all(24),
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text("Home"),
              onTap: () {
                print("Ban vua chuyen sang Home!");
              },
            ),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text("Go to detail sample"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BaiDangItem()));
              },
            ),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text("Chuyen DarkMode"),
              onTap: () {
                print("Vua tap vao drawer 3!");
              },
            ),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text("Dang xuat"),
              onTap: () {
                print("Vua tap vao dang xuat!");
                FirebaseAuth.instance.signOut();
                // Navigator.pop(context);
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => Login()));
              },
            ),
            Divider(
              color: Colors.deepOrange,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                print("Vua tap vao drawer 5!");
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.question_mark),
              title: Text("Help"),
              onTap: () {
                print("Thong tin cua user hien tai:");
                print("Email: " + (cruser?.email).toString());
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Contact to binh"),
              onTap: () {
                print("Vua tap vao drawer 7!");
              },
            ),
          ],
        ),
      );
}
