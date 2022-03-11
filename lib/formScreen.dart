import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_app/variable.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

bool btnActive = true;

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(apps.appName)),
        backgroundColor: apps.mainColor,
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ElevatedButton(
                onPressed: btnActive == true
                    ? () {
                        Timer(Duration(seconds: 3), () {
                          setState(() {
                            btnActive = false;
                          });
                        });
                      }
                    : null,
                child: const Text("Submit"))
          ],
        ));
  }
}
