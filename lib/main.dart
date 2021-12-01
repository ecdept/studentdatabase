import 'package:flutter/material.dart';
import 'package:ecstudents/functions.dart';
import 'package:ecstudents/studentmodel.dart';

import 'homepage.dart';
 late int updateid;

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDataBase();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}


