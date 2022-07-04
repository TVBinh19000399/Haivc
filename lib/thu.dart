import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//chuyen data sang man hinh thu hai
class TestState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestStateState();
  }
}

class _TestStateState extends State<TestState> {
  List<bool> _checkedItem = [true, false, false, true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text("Info of user"),
        ),
        body: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.access_alarm),
              title: Text("Mat hang 1"),
              subtitle: Text("Su dung CupertinoSwitch"),
              trailing: CupertinoSwitch(
                value: _checkedItem[0],
                onChanged: (bool value) {
                  setState(() {
                    _checkedItem[0] = value;
                  });
                },
              ),
              onTap: () {
                print("Ban vua bam vao list");
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Mat hang 2"),
              subtitle: Text("Su dung CupertinoSwitch"),
              trailing: CupertinoSwitch(
                value: _checkedItem[1],
                onChanged: (bool value) {
                  setState(() {
                    _checkedItem[1] = value;
                  });
                },
              ),
              onTap: () {
                print("Ban vua bam vao list");
              },
            ),
            ListTile(
              leading: Icon(Icons.sailing),
              title: Text("Mat hang 3"),
              subtitle: Text("Su dung CupertinoSwitch"),
              trailing: CupertinoSwitch(
                value: _checkedItem[2],
                onChanged: (bool value) {
                  setState(() {
                    _checkedItem[2] = value;
                  });
                },
              ),
              onTap: () {
                print("Ban vua bam vao list");
              },
            ),
            ListTile(
              leading: Icon(Icons.backpack),
              title: Text("Mat hang 4"),
              subtitle: Text("Su dung CupertinoSwitch"),
              trailing: CupertinoSwitch(
                value: _checkedItem[3],
                onChanged: (bool value) {
                  setState(() {
                    _checkedItem[3] = value;
                  });
                },
              ),
              onTap: () {
                print("Ban vua bam vao list");
              },
            ),
            ListTile(
              leading: Icon(Icons.signal_wifi_connected_no_internet_4),
              title: Text("Mat hang 5"),
              subtitle: Text("Su dung CupertinoSwitch"),
              trailing: CupertinoSwitch(
                value: _checkedItem[4],
                onChanged: (bool value) {
                  setState(() {
                    _checkedItem[4] = value;
                  });
                },
              ),
              onTap: () {
                print("Ban vua bam vao list");
              },
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  //display result
                  _checkedItem.forEach((element) {
                    print("item ${element}");
                  });
                  //navigator page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(Detail(_checkedItem)),
                    ),
                  );
                },
                child: Text("See result"),
              ),
            )
          ],
        ));
  }
}

class SecondPage extends StatelessWidget {

  Detail dt;

  SecondPage(this.dt);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Trang ket qua"),
        ),
        body: Center(
          child: Column(
            children:
            dt.checkedItem.map<Widget>((v) => Text(v.toString())).toList()

            ,
          ),
        ));
  }

}


class Detail {
  List<bool> checkedItem;

  Detail(this.checkedItem);
}