import 'package:flutter/material.dart';
import 'mockdata.dart';

class ListNews extends StatelessWidget {
  final samplecontent = mockdsbaidang;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: samplecontent.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text("this is content.")
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      imageShow(index),
                      Positioned(
                          top: 10,
                          left: 14,
                          child: Container(
                            // padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.black45,
                                border:
                                    Border.all(color: Colors.grey, width: 2)),
                            child: Row(
                              children: [
                                Text("@",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)),
                                Text(
                                  samplecontent[index].authorName,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                  Container(
                    child: Row(
                      children: [
                        //like button
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () =>
                                    {print("Ban vua like bai dang $index")},
                                child: Text("Like"))),
                        SizedBox(
                          width: 12,
                        ),
                        //comment button
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () =>
                                    {print("Ban vua comment bai dang $index")},
                                child: Text("Comment"))),
                        SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Divider(
                      color: Colors.orange,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }

  Widget imageShow(int index) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.hardEdge,
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: 20,
                ),
                flex: 1,
              ),
              Expanded(
                  child: Image.network(samplecontent[index].image), flex: 19),
              Expanded(
                child: SizedBox(
                  width: 20,
                ),
                flex: 1,
              ),
            ],
          ),
        ));
  }
}

//hoan thien: them placedholder cho anh
//
