import 'package:flutter/material.dart';
import 'package:form_app/variable.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: apps.mainColor,
      body: Center(child: Text("Hellow")),
    );
  }
}
