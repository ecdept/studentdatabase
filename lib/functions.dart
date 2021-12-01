import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ecstudents/studentmodel.dart';


ValueNotifier<List<StudentModel>> studentlist = ValueNotifier([]);

late Database _db;
Future<void>initializeDataBase()async{
_db=await openDatabase(
    'student1.db',
    version: 1,
    onCreate:(Database db, int version)async{
  await db.execute(
      'CREATE TABLE student(id INTEGER PRIMARY KEY,name TEXT,age TEXT)'
  );
}, );
}

Future<void> addtonotifier(StudentModel modal)async {

  // final studentDB=await Hive.openBox<StudentModel>('student_db');
  // final _id=await studentDB.add(modal);
  // modal.id=_id;
_db.rawInsert('INSERT INTO student(name,age,id) VALUES(?,?,?)',[modal.name,modal.age,modal.id]);
getallStudents();
 // studentlist.value.add(modal);

 // studentDB.put(_id, modal);
//  studentlist.notifyListeners();
}

Future<void> getallStudents()async{
  //final studentDB=await Hive.openBox<StudentModel>('student_db');

  final _values=await _db.rawQuery('SELECT * FROM student');
  print(_values);
    studentlist.value.clear();
  _values.forEach((map) {
   final student= StudentModel.fromMap(map);
   studentlist.value.add(student);

   studentlist.notifyListeners();

  });
 // studentlist.value.addAll(studentDB.values);
}
Future<void> deleteStudent(StudentModel todelete)async{
 // final studentDB=await Hive.openBox<StudentModel>('student_db');
  //studentDB.delete(id);

  print(todelete.id);
  if(todelete.id==1){
    studentlist.value.clear();
    studentlist.notifyListeners();
  }

  await _db.rawDelete('DELETE FROM student WHERE id=?',[todelete.id] );
  getallStudents();
}
Future<void> updateStudent(StudentModel toupdate)async{
  await _db.rawUpdate('UPDATE student SET id=?,name=?,age=? WHERE id=?',[toupdate.id,toupdate.name,toupdate.age,toupdate.id]);
  getallStudents();
}



