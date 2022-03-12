
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var value = 0;
  loadValue() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    setState(() {
      value = pre.getInt("value") ?? 0;
    });
  }

  incriment() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    setState(() {
      value++;
      pre.setInt("value", value);
    });
  }

  @override
  void initState() {
    super.initState();
    loadValue();
  }

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
                onPressed:incriment)),
      )),
    );
  }
}
