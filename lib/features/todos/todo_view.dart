import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_mvvm_crud/features/todos/todo_viewmodel.dart';
import 'package:riverpod_mvvm_crud/features/todos/widgets/add_todo_textfield.dart';
import 'package:riverpod_mvvm_crud/features/todos/widgets/button.dart';
import 'package:riverpod_mvvm_crud/features/todos/widgets/show_modal.dart';
import 'package:riverpod_mvvm_crud/model/todo_model.dart';
import 'package:riverpod_mvvm_crud/utils/constants/route_constants.dart';
import 'package:riverpod_mvvm_crud/utils/constants/string_constants.dart';
import 'package:riverpod_mvvm_crud/utils/theme/app_theme.dart';

class ToDoView extends ConsumerWidget {
  final TextEditingController controller = TextEditingController();
  ToDoView({super.key});

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
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      height: 200,
                      margin:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Column(
                        children: [
                          addTodoTextField(
                              controller: controller, onChange: (value) {}),
                          button(
                              onPressed: () {
                                Navigator.pop(context);

                                ref
                                    .read(todoViewModelProvider.notifier)
                                    .addTodo(Todos(
                                        id: data.value!.todos!.length + 1,
                                        todo: controller.text,
                                        completed: false,
                                        userId: data.value!.todos!.length + 1));
                              },
                              title: "Submit")
                        ],
                      ),
                    ),
                  );
                });
          },
          child: const Icon(Icons.add),
        ),
        body: data.when(
            data: (data) => ListView.builder(
                itemCount: data.todos!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      // ref.read(todoViewModelProvider.notifier).updateTodo(
                      //     data.todos![index],
                      //     Todos(
                      //         id: data.todos![index].id,
                      //         todo: "Afrin updated one todo",
                      //         completed: false,
                      //         userId: data.todos![index].userId));
                    },
                    onTap: () {
                      Application.router.navigateTo(
                          context, RouteConstants.todoDetails,
                          transition: TransitionType.fadeIn,
                          routeSettings:
                              RouteSettings(arguments: data.todos![index]));
                      // ref
                      //     .read(todoViewModelProvider.notifier)
                      //     .removeTodo(data.todos![index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Text(data.todos![index].todo!),
                        trailing: IconButton(
                          onPressed: () {
                            // Application.router.navigateTo(
                            //     context, RouteConstants.todoDetails,
                            //     transition: TransitionType.fadeIn,
                            //     routeSettings: RouteSettings(
                            //         arguments: data.todos![index]));

                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                builder: (context) {
                                  return showCRUDOptions(onDeletePressed: () {
                                    Navigator.pop(context);
                                    ref
                                        .read(todoViewModelProvider.notifier)
                                        .removeTodo(data.todos![index]);
                                  }, onUpdatePressed: () {
                                    Navigator.pop(context);
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(25.0),
                                          ),
                                        ),
                                        builder: (context) {
                                          controller.text =
                                              data.todos![index].todo!;
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            child: Container(
                                              height: 200,
                                              margin: const EdgeInsets.only(
                                                  top: 20, left: 20, right: 20),
                                              child: Column(
                                                children: [
                                                  addTodoTextField(
                                                      controller: controller,
                                                      onChange: (value) {}),
                                                  button(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        ref
                                                            .read(
                                                                todoViewModelProvider
                                                                    .notifier)
                                                            .updateTodo(
                                                                data.todos![
                                                                    index],
                                                                Todos(
                                                                    id: data
                                                                        .todos![
                                                                            index]
                                                                        .id,
                                                                    todo: controller
                                                                        .text,
                                                                    completed:
                                                                        false,
                                                                    userId: data
                                                                        .todos![
                                                                            index]
                                                                        .userId));
                                                      },
                                                      title: "Update")
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  });
                                });
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
