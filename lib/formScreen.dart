// ignore: file_names
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_app/variable.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  bool btnActive = false;
  late TextEditingController emailController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    emailController.addListener(() {
      final btnActive = emailController.text.isNotEmpty;
      setState(() {
        this.btnActive = btnActive;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const inputDecoration = InputDecoration(
                  label: Text("Name"), border: OutlineInputBorder());
    return Scaffold(
        appBar: AppBar(title: const Text(apps.appName)),
        backgroundColor: apps.mainColor,
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextField(
              decoration: inputDecoration,
              controller: emailController,
            ),
            ElevatedButton(
                onPressed: btnActive == true
                    ? () {
                        btnActive = false;
                        Fluttertoast.showToast(
                            backgroundColor: apps.toostColor,
                            msg: "Your request has been submited");
                        emailController.clear();
                      }
                    : null,
                child: const Text("Submit"))
          ],
        ));
  }
}
