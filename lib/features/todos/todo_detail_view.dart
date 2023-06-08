import 'package:flutter/material.dart';
import 'package:riverpod_mvvm_crud/model/todo_model.dart';
import 'package:riverpod_mvvm_crud/utils/theme/app_theme.dart';

class TodoDetailView extends StatelessWidget {
  final Todos todos;
  const TodoDetailView({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "USER-ID: ${todos.userId}",
        style: AppTheme.appbarStyle,
      )),
      body: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Todo ID:",
                    style: AppTheme.font12Bold,
                  ),
                  Text(
                    todos.id.toString(),
                    style: AppTheme.font12Regular,
                    maxLines: 3,
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Todo UserID:", style: AppTheme.font12Bold),
                  Text(todos.userId.toString(),
                      style: AppTheme.font12Regular, maxLines: 3)
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Todo Name:", style: AppTheme.font12Bold),
                  Text(todos.todo.toString(),
                      style: AppTheme.font12Regular, maxLines: 3)
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Todo STATUS:", style: AppTheme.font12Bold),
                  Text(todos.completed.toString(),
                      style: AppTheme.font12Regular, maxLines: 3)
                ],
              )
            ],
          )),
    );
  }
}
