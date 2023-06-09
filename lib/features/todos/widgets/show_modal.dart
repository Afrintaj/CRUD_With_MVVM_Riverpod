import 'package:flutter/material.dart';

Widget showCRUDOptions(
    {required Function() onDeletePressed,
    required Function() onUpdatePressed}) {
  return Wrap(
    children: [
      GestureDetector(
        onTap: onDeletePressed,
        child: const ListTile(
          leading: Icon(Icons.delete),
          title: Text('Delete'),
        ),
      ),
      GestureDetector(
        onTap: onUpdatePressed,
        child: const ListTile(
          leading: Icon(Icons.update),
          title: Text('Update'),
        ),
      ),
    ],
  );
}
