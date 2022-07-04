import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:haivc/pages.dart';

import 'login_page.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignUpState();
  }
}

class SignUpState extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Sign up to HAIVC"),
          backgroundColor: Colors.orange,
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                    radius: 52,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSQo_rfcDCwqgttOC87yGZ31tdA_Ek1n0Dm3Cfc4PmoSD83Z9R3v0kWy1tGnkaTEZwSwk&usqp=CAU')),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "SIGN UP",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                //tai khoan
                TextField(
                  textAlign: TextAlign.left,
                  controller: emailController,
                  autocorrect: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'youremail@gmail.com',
                    labelText: 'Email:',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                //mat khau
                TextField(
                  textAlign: TextAlign.left,
                  obscureText: true,
                  autocorrect: false,
                  controller: passwordController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: '******',
                    labelText: 'Password:',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.visibility),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                //mat khau
                TextField(
                  textAlign: TextAlign.left,
                  obscureText: true,
                  autocorrect: false,
                  controller: passwordController2,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: '******',
                    labelText: 'Xac nhan:',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.visibility),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text("SIGN UP".toUpperCase(),
                      style: TextStyle(fontSize: 20)),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.orange),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.orange)))),
                  onPressed: () {
                    print("Ban vua bam dang ki!");
                    if (passwordController.text.trim() ==
                        passwordController2.text.trim())
                      signUp(context);
                    else {
                      print("Hay nhap dung ma khau!");
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Future signUp(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      print("Dang ki thanh cong!");
      Navigator.pop(context);
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PageChanging()));
    } on FirebaseAuthException catch (e) {
      print("Dang ki gap loi!");
      print(e);
    }
  }
}
