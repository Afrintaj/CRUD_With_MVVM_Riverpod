import 'package:flutter/material.dart';

Widget button({required Function()? onPressed, required String title}) {
  return ElevatedButton(onPressed: onPressed, child: Text(title));
}
