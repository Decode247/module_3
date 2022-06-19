import 'package:module_3/customized.dart';
import 'package:module_3/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController createPasswordCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();

  @override
  void dispose() {
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    createPasswordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register new account"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          elevation: 30,
          color: Colors.purpleAccent,
          margin: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 60,
          ),
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  myTextField(
                    label: "Fist Name",
                    ctrl: firstNameCtrl,
                  ),
                  const SizedBox(height: 35),
                  myTextField(
                    label: "Last Name",
                    ctrl: lastNameCtrl,
                  ),
                  const SizedBox(height: 35),
                  myTextField(
                    label: "Email Address",
                    ctrl: emailCtrl,
                  ),
                  const SizedBox(height: 35),
                  myTextField(
                    label: "Create Password",
                    ctrl: createPasswordCtrl,
                    isPassward: true,
                  ),
                  const SizedBox(height: 35),
                  myTextField(
                    label: "Confirm Password",
                    ctrl: confirmPasswordCtrl,
                    isPassward: true,
                  ),
                  const SizedBox(height: 20),
                  myBtn(
                    tittle: "Register",
                    onPressed: () {
                      if (firstNameCtrl.text != "" &&
                          lastNameCtrl.text != "" &&
                          createPasswordCtrl.text != "") {
                        if (createPasswordCtrl.text ==
                            confirmPasswordCtrl.text) {
                          Get.off(
                            () => const Login(),
                            arguments: [
                              firstNameCtrl.text,
                              lastNameCtrl.text,
                              emailCtrl.text,
                              createPasswordCtrl.text,
                            ],
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Password not match',
                                style: TextStyle(color: Colors.red),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.white,
                            content: Text(
                              'All fields Are required',
                              style: TextStyle(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                            dismissDirection: DismissDirection.startToEnd,
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have account?"),
                      InkWell(
                        child: const Text(
                          "SignIn",
                          style: TextStyle(
                            color: Color.fromARGB(255, 27, 70, 144),
                          ),
                        ),
                        onTap: () {
                          Get.off(() => const Login());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
