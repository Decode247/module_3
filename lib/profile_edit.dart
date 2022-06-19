import 'package:module_3/customized.dart';
import 'package:module_3/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController firstnameCtrl =
      TextEditingController(text: Get.arguments[0]);
  TextEditingController lastnameCtrl =
      TextEditingController(text: Get.arguments[1]);

  bool edit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profie"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAll(
              () => const Dashboard(),
              arguments: [firstnameCtrl.text, lastnameCtrl.text],
            );
          },
        ),
      ),
      body: Center(
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          elevation: 30,
          color: Colors.purpleAccent,
          margin: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 40,
          ),
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  myTextField(
                    label: "First Name",
                    ctrl: firstnameCtrl,
                    editable: edit,
                  ),
                  const SizedBox(height: 70),
                  myTextField(
                    label: "Last Name",
                    ctrl: lastnameCtrl,
                    editable: edit,
                  ),
                  const SizedBox(height: 60),
                  myBtn(
                    tittle: edit ? "Save Changes" : "Edit Profile",
                    onPressed: () {
                      editIsPressed();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String userInfo(int index) {
    List<String> myData = Get.arguments;
    return myData[index];
  }

  editIsPressed() {
    setState(() {
      edit = !edit;
    });
  }
}
