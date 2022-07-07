import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:haivc/UserRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:haivc/sharedpreference.dart';
import 'package:haivc/thu.dart';
import 'package:haivc/upload_page.dart';
import 'baidang.dart';
import 'baidang_item.dart';
import 'dsbaidang.dart';
import 'pages.dart';
import 'login_page.dart';
import 'sign_up_page.dart';
import 'setting_page.dart';
import 'information_page.dart';
import 'info_user.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseAuth.instance.signOut();
  runApp(HaivcApp());
}

// void main() {
//   runApp(HaivcApp());
// }


class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (contex, snapshot) {
        if (snapshot.hasData) {
          print("Dang nhap thanh cong");
          print("Snapshot: "+snapshot.toString());
          return PageChanging();
        } else {
          print("Thong tin dang nhap khong chinh xac");
          return Login();
        }
      },
    ));
  }
}

class HaivcApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //full app
    // return MaterialApp(
    //   title: 'Hai vc',
    //   home: PageChanging(),
    // );


    // giao dien dang nhap, dang ki
    // return MaterialApp(home: SignUp());
    // return MaterialApp(home: Login());

    //tuy chinh cai dat
    // return MaterialApp(
    //     home: Scaffold(
    //       body: SettingsPage(),
    //       appBar: AppBar(
    //         title: const Text('HAIVC'),
    //         backgroundColor: Colors.deepOrange,
    //       ),
    //     ));

    //tuy chinh trang chat
    // return MaterialApp(
    //     home: Scaffold(
    //       body: ListComments(),
    //       appBar: AppBar(
    //         title: const Text('Discussion room'),
    //         backgroundColor: Colors.deepOrange,
    //       ),
    //     ));

    //tuy chinh giao dien phan chat
    // return MaterialApp(home: ListComments(),);

    //test state
    // return MaterialApp(home: TestState(),);

    //giao dien phan thong tin ca nhan
    // return MaterialApp(home: UserInfos(),);

    //giao dien trang upload page
    return MaterialApp(home: UploadPage(),);

    //chuc nang login, ok
    // return MaterialApp(home: MainPage());

    //chuc nang dang ki, ok
    // return MaterialApp(home: SignUp());

    //test chuc nang shared preference, ok
    // return MaterialApp(home: SharedPrefer());

    //test chuc nang thu
    return MaterialApp(home: HomePage());

  }
}
