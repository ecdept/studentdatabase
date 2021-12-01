import 'package:flutter/material.dart';
import 'package:ecstudents/functions.dart';
import 'package:ecstudents/studentmodel.dart';

import 'main.dart';

class update extends StatelessWidget {
  final studentname = TextEditingController();
  final studentage = TextEditingController();
 //int id=1;
  //update(int? id );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(),
                ),
                controller: studentname,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Empty';
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Age',
                  border: OutlineInputBorder(),
                ),
                controller: studentage,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Empty';
                  }
                },
              ),
            ),
            IconButton(onPressed: (){
              updatelistonpress();
              Navigator.of(context).pop();
            },icon: Icon(Icons.edit),)


          ],
        ),
      ),
    );
  }
  Future<void> updatelistonpress() async {
    final namefromcontrlr = studentname.text;
    final agefromcontrlr = studentage.text;
    final modal1 = StudentModel(name: namefromcontrlr, age: agefromcontrlr,id:updateid);
    updateStudent(modal1);


  }
}
