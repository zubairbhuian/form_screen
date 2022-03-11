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
    return Scaffold(
        appBar: AppBar(title: const Text(apps.appName)),
        backgroundColor: apps.mainColor,
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextField(
              decoration: InputDecoration(
                  label: Text("Name"), border: OutlineInputBorder()),
              controller: emailController,
            ),
            ElevatedButton(
                onPressed: btnActive == true
                    ? () {
                        setState(() {
                          btnActive = false;
                          Fluttertoast.showToast(
                              backgroundColor: apps.toostColor,
                              msg: "Your request has been submited");
                        });
                      }
                    : null,
                child: const Text("Submit"))
          ],
        ));
  }
}
