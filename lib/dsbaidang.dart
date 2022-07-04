import 'package:flutter/material.dart';
import 'mockdata.dart';

//hien thi sanh sach bai dang
var danhsachbaidang = mockdsbaidang;

class DSBaiDang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              danhsachbaidang[0].toString(),
              style: TextStyle(fontSize: 25, color: Colors.blue),
              textDirection: TextDirection.ltr,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          Container(
            child: Text(
              danhsachbaidang[1].toString(),
              style: TextStyle(fontSize: 25, color: Colors.white),
              textDirection: TextDirection.ltr,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          Container(
            child: Text(
              danhsachbaidang[2].toString(),
              style: TextStyle(fontSize: 25, color: Colors.yellow),
              textDirection: TextDirection.ltr,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          Container(
            child: Text(
              danhsachbaidang[3].toString(),
              style: TextStyle(fontSize: 25, color: Colors.orange),
              textDirection: TextDirection.ltr,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        ],
      ),
    );
  }
}
