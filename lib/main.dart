import 'package:flutter/material.dart';

import 'dbhelper.dart';
import 'list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHandler().initializeDB();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todos',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      home: ListScreen(),
    );
  }
}
