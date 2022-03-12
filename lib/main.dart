import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var value = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(title: const Text(" My App")),
        body: Center(
            child: ElevatedButton(
                child: Text("Click $value Times"),
                onPressed: () {
                  setState(() {
                    value++;
                  });
                })),
      )),
    );
  }
}
