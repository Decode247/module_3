import 'package:module_3/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'customized.dart';
import 'dashboard.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  final dynamic profile = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to iDoc Programming Login"),
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
                    label: "Email Address",
                    ctrl: emailCtrl,
                  ),
                  const SizedBox(height: 40),
                  myTextField(
                    label: "Password",
                    ctrl: passwordCtrl,
                    isPassward: true,
                  ),
                  const SizedBox(height: 70),
                  myBtn(
                    tittle: "LogIn",
                    onPressed: () {
                      if (profile != null) {
                        if (profile[2] == emailCtrl.text &&
                            profile[3] == passwordCtrl.text) {
                          Get.off(
                            () => const Dashboard(),
                            arguments: [profile[0], profile[1]],
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'incorrect email or password',
                                style: TextStyle(color: Colors.red),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }
                      } else if (profile == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Account does not exist',
                              style: TextStyle(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Register new account?"),
                      InkWell(
                        child: const Text(
                          "SignUp",
                          style: TextStyle(
                            color: Color.fromARGB(255, 27, 70, 144),
                          ),
                        ),
                        onTap: () {
                          Get.off(() => const Register());
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
