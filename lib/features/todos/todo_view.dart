import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_mvvm_crud/features/todos/todo_viewmodel.dart';
import 'package:riverpod_mvvm_crud/model/todo_model.dart';
import 'package:riverpod_mvvm_crud/utils/constants/route_constants.dart';
import 'package:riverpod_mvvm_crud/utils/constants/string_constants.dart';
import 'package:riverpod_mvvm_crud/utils/theme/app_theme.dart';

class ToDoView extends ConsumerWidget {
  const ToDoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(todoViewModelProvider);
    return Scaffold(
        appBar: AppBar(
            title: Text(
          StringConstants.appbarTitle,
          style: AppTheme.appbarStyle,
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(todoViewModelProvider.notifier).addTodo(Todos(
                id: data.value!.todos!.length + 1,
                todo: "Afrin added one todo",
                completed: false,
                userId: data.value!.todos!.length + 1));
          },
          child: const Icon(Icons.add),
        ),
        body: data.when(
            data: (data) => ListView.builder(
                itemCount: data.todos!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      ref.read(todoViewModelProvider.notifier).updateTodo(
                          data.todos![index],
                          Todos(
                              id: data.todos![index].id,
                              todo: "Afrin updated one todo",
                              completed: false,
                              userId: data.todos![index].userId));
                    },
                    onTap: () {
                      ref
                          .read(todoViewModelProvider.notifier)
                          .removeTodo(data.todos![index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Text(data.todos![index].todo!),
                        trailing: IconButton(
                          onPressed: () {
                            Application.router.navigateTo(
                                context, RouteConstants.todoDetails,
                                transition: TransitionType.fadeIn,
                                routeSettings: RouteSettings(
                                    arguments: data.todos![index]));
                          },
                          icon: const Icon(Icons.menu),
                        ),
                      ),
                    ),
                  );
                }),
            error: (error, trace) => const Center(
                  child: Text("Error!!!!"),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
