import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SharedPreferState();
  }
}

class _SharedPreferState extends State<SharedPrefer> {
  final String noidung = "Noi dung trong";
  final noidungController = TextEditingController();
  late SharedPreferences prefs;

  getSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  saveStringValue(String noidung) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString("noidung", noidungController.text.trim());
  }

  retrieveStringValue() async {
    prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString("noidung");
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared preference testing"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text(noidung),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: noidungController,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  saveStringValue(noidungController.text.trim());
                  print("da thuc hien luu!");
                },
                child: Text("Save"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  retrieveStringValue();
                },
                child: Text("Get"),
              ),
            ],
          ),
        ),
        margin: EdgeInsets.all(30),
      ),
    );
  }

  void insertValue(String noidung) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('noidung', noidung);
    print("noi dung vua luu: ${prefs.getString('noidung')}");
  }

  Future<String?> getValue() async {
    final prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString('noidung');
    return action;
  }
}
