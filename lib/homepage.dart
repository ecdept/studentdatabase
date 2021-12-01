import 'package:flutter/material.dart';
import 'package:ecstudents/functions.dart';
import 'package:ecstudents/studentmodel.dart';
import 'package:ecstudents/update.dart';

import 'main.dart';

class Homepage extends StatelessWidget {


  final studentname = TextEditingController();
  final studentage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getallStudents();
    final _Formkey = GlobalKey<FormState>();
    return SafeArea(
        child: Scaffold(
          body: Form(
            key: _Formkey,
            child: Column(
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
                ElevatedButton(
                  onPressed: () {
                    if (_Formkey.currentState!.validate()) {
                      addtolistonpress();
                    }

                  },
                  child: Text('Add Student Details'),
                ),
                ValueListenableBuilder(
                  valueListenable: studentlist,
                  builder: (BuildContext context, List<StudentModel> value2,
                      Widget? child) {
                    return Expanded(
                      child: ListView.separated(

                        itemBuilder: (BuildContext context, int index) {
                          final itemfromlist = value2[index];
                          print('id'+itemfromlist.id.toString());
                          updateid=itemfromlist.id!;
                          return ListTile(
                            leading:IconButton(onPressed: (){
                              Navigator.of( context).push(MaterialPageRoute(builder: (ctx)=>update()));

                            },icon: Icon(Icons.edit),) ,
                            title: Text(itemfromlist.name),
                            subtitle: Text(itemfromlist.age),
                              trailing: IconButton(onPressed: (){
                                      deleteStudent(itemfromlist);
                                //  if(itemfromlist.id!=null){
                                //    deleteStudent(itemfromlist.id!);
                                //
                                //  }
                                // else{
                                //    print('student id null');
                                //  }
                              },icon: Icon(Icons.delete,color: Colors.red,),),

                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                        itemCount: value2.length,

                      ),
                    );
                  },

                ),
              ],
            ),
          ),
        ));
  }

  Future<void> addtolistonpress() async {
    final namefromcontrlr = studentname.text;
    final agefromcontrlr = studentage.text;
    final modal = StudentModel(name: namefromcontrlr, age: agefromcontrlr);
    addtonotifier(modal);

  }

//   void addtonotifier(StudentModel value1) {
//     studentlist.value.add(value1);
//     studentlist.notifyListeners();
//   }
 }
