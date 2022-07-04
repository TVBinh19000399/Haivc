import 'package:flutter/material.dart';
import 'sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginState();
  }
}

class LoginState extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Login to HAIVC"),
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
                  "LOGIN",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                //tai khoan
                TextField(
                  textAlign: TextAlign.left,
                  autocorrect: true,
                  controller: emailController,
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
                  controller: passwordController,
                  autocorrect: false,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: '******',
                    labelText: 'Password:',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.visibility),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    child: Text("LOGIN".toUpperCase(),
                        style: TextStyle(fontSize: 20)),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.orange),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.orange)))),
                    onPressed: () {
                      print("Ban vua bam dang nhap!");
                      print("Email: " + emailController.text.trim());
                      print("Password: " + passwordController.text.trim());
                      logIn();
                    }),

                TextButton(
                    child: Text("SIGN UP".toUpperCase(),
                        style: TextStyle(fontSize: 20)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.fromLTRB(5, 5, 5, 5)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.orange),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.orange)))),
                    onPressed: () {
                      print("ban vua bam dang ki");
                    }),
              ],
            ),
          ),
        ));
  }

  Future logIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }
}
