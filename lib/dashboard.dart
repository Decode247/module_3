import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_3/doc.dart';
import 'package:module_3/profile_edit.dart';
import 'package:url_launcher/link.dart';
import 'package:module_3/customized.dart';
import 'package:module_3/login.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("iDoc Dashboard"),
        centerTitle: true,
        actions: [
          const Icon(Icons.notifications),
          const SizedBox(width: 18),
          CircleAvatar(
            child: IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Get.to(() => const UserProfile(), arguments: Get.arguments);
              },
            ),
          ),
          const SizedBox(width: 18),
        ],
      ),
      floatingActionButton: Link(
        uri: Uri.parse('https://stackoverflow.com/'),
        target: LinkTarget.blank,
        builder: (context, followLink) => IconButton(
          onPressed: followLink,
          icon: const Icon(
            Icons.help_center_rounded,
            color: Colors.purpleAccent,
          ),
        ),
      ),
      drawer: Drawer(
        width: Get.width * 0.40,
        backgroundColor: const Color.fromARGB(0, 250, 246, 246),
        elevation: 0.1,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Get.offAll(
                    () => const UserProfile(),
                    arguments: Get.arguments,
                  );
                },
                child: const Text("Profile"),
              ),
              const SizedBox(height: 10),
              const Divider(height: 10, color: Colors.grey),
              Link(
                uri: Uri.parse('https://stackoverflow.com/'),
                target: LinkTarget.blank,
                builder: (context, followLink) => TextButton(
                  onPressed: followLink,
                  child: const Text("Help"),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(height: 10, color: Colors.grey),
              TextButton(
                onPressed: () {},
                child: const Text("Share"),
              ),
              const Divider(height: 10, color: Colors.grey),
              TextButton(
                onPressed: () {},
                child: const Text("Rate Us"),
              ),
              const SizedBox(height: 10),
              const Divider(height: 10, color: Colors.grey),
              TextButton(
                onPressed: () {},
                child: const Text("About"),
              ),
              const SizedBox(height: 10),
              const Divider(height: 10, color: Colors.grey),
              TextButton(
                onPressed: () {
                  Get.offAll(() => const Login());
                },
                child: const Text("Logout"),
              ),
              const SizedBox(height: 10),
              const Divider(height: 10, color: Colors.grey),
            ],
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myBtn(
                tittle: "Documentations ",
                bePadded: true,
                onPressed: () {
                  Get.to(() => const Documentations());
                },
                h: 0.03,
              ),
              const SizedBox(height: 50),
              Link(
                uri: Uri.parse('https://www.w3schools.com/'),
                target: LinkTarget.self,
                builder: (context, followLink) =>
                    myBtn(tittle: 'W3School Site', onPressed: followLink),
              ),
              const SizedBox(height: 50),
              myBtn(
                tittle: "Profile",
                bePadded: true,
                onPressed: () {
                  Get.to(
                    () => const UserProfile(),
                    arguments: Get.arguments,
                  );
                },
                h: 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
