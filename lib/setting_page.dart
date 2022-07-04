import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkmode = false;
  final items = [
    'item 1',
    'item 2',
    'item 3',
    'item 4',
    'item 5',
    'item 6',
    'item 7',
  ];

  @override
  Widget build(BuildContext context) {
    //ham nay hoat dong hien thi mau tren web, tren mobile chi hien mau selected
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.orange;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: Icon(Icons.access_alarm),
              title: Text("dong nay vua moi sua"),
              subtitle: Text("This is subtitle"),
              onTap: () {
                print("Ban vua bam vao list");
              },
              trailing: Icon(Icons.select_all_rounded),
            ),
            ListTile(
              leading: Icon(Icons.access_alarm),
              title: Text("This is content"),
              subtitle: Text("su dung listtile voi enabled la true"),
              onTap: () {
                print("Ban vua bam vao list");
              },
              enabled: true,
            ),
            ListTile(
              leading: Icon(Icons.access_alarm),
              title: Text("This is content"),
              subtitle: Text("su dung listtile voi enabled la false"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Ban vua bam vao list");
              },
              enabled: false,
            ),
            ListTile(
              leading: Icon(Icons.access_alarm),
              title: Text("This is content"),
              subtitle: Text("su dung selected true"),
              selected: true,
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Ban vua bam vao list");
              },
            ),
            SwitchListTile(
                title: Text('Su dung switchListTile'),
                value: _darkmode,
                onChanged: (bool value) {
                  setState(() {
                    _darkmode = value;
                  });
                }),
            ListTile(
              leading: Icon(Icons.access_alarm),
              title: Text("Doi trang thay den"),
              subtitle: Text("Su dung CupertinoSwitch"),
              trailing: CupertinoSwitch(
                value: _darkmode,
                onChanged: (bool value) {
                  setState(() {
                    _darkmode = value;
                  });
                },
              ),
              onTap: () {
                print("Ban vua bam vao list");
              },
            ),
            ListTile(
              leading: Icon(Icons.access_alarm),
              title: Text("This is content"),
              subtitle: Text("su dung checkBox"),
              trailing: Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: _darkmode,
                onChanged: (bool? value) {
                  setState(() {
                    _darkmode = value!;
                  });
                },
              ),
              onTap: () {
                print("Ban vua bam vao list");
              },
            ),
            ListTile(
              leading: Icon(Icons.access_alarm),
              title: Text("This is content 8"),
              subtitle: Text("This is subtitle"),
              onTap: () {
                print("Ban vua bam vao list");
              },
            ),
            ListTile(
              leading: Icon(Icons.access_alarm),
              title: Text("This is content 9"),
              subtitle: Text("This is subtitle"),
              onTap: () {
                print("Ban vua bam vao list");
              },
            ),
            ListTile(
              leading: Icon(Icons.access_alarm),
              title: Text("This is content 10"),
              subtitle: Text("This is subtitle"),
              onTap: () {
                print("Ban vua bam vao list");
              },
            ),
          ],
        ),
      ),
    );
  }
}
