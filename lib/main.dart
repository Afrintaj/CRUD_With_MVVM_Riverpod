import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_mvvm_crud/features/todos/todo_detail_view.dart';
import 'package:riverpod_mvvm_crud/features/todos/todo_view.dart';
import 'package:riverpod_mvvm_crud/model/todo_model.dart';
import 'package:riverpod_mvvm_crud/utils/constants/route_constants.dart';

void main() {
  FluroRouter router = FluroRouter();
  Application.router = router;

  // Todo View
  router.define(RouteConstants.root,
      handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return const ToDoView();
  }));

// Todo Details
  router.define(RouteConstants.todoDetails,
      handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
    final todoParams = ModalRoute.of(context!)!.settings.arguments as Todos;
    return TodoDetailView(todos: todoParams);
  }));
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteConstants.root,
      onGenerateRoute: Application.router.generator,
      debugShowCheckedModeBanner: false,
    );
  }
}
