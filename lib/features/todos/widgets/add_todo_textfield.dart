import 'package:flutter/material.dart';
import 'package:riverpod_mvvm_crud/utils/constants/string_constants.dart';
import 'package:riverpod_mvvm_crud/utils/theme/app_theme.dart';

Widget addTodoTextField(
    {required TextEditingController controller,
    required Function(String?) onChange}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Text(
          StringConstants.createTodo,
          style: AppTheme.font12Bold.copyWith(fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: controller,
          onChanged: onChange,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    ),
  );
}
