import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget myTextField({
  String label = "",
  required TextEditingController ctrl,
  bool isPassward = false,
  bool editable = true,
}) {
  return TextField(
    controller: ctrl,
    obscureText: isPassward,
    style: const TextStyle(
      color: Color.fromARGB(255, 34, 1, 41),
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    enabled: editable,
    decoration: InputDecoration(
      label: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      fillColor: const Color.fromARGB(255, 48, 2, 58),
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.purple,
          style: BorderStyle.solid,
          width: 10,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
    ),
  );
}

Widget myBtn({
  required String tittle,
  required Function()? onPressed,
  bool bePadded = false,
  double w = 0.25,
  double h = 0.02,
}) {
  return MaterialButton(
    padding: bePadded
        ? EdgeInsets.symmetric(
            horizontal: Get.width * w, vertical: Get.height * h)
        : const EdgeInsets.all(8.0),
    onPressed: onPressed,
    color: Colors.purple,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Center(
      child: Text(
        tittle,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}
