import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_mvvm_crud/model/todo_model.dart';
import 'package:riverpod_mvvm_crud/service/todo_service.dart';

final todoViewModelProvider =
    StateNotifierProvider<TodoViewModel, AsyncValue<ToDoModel>>((ref) {
  return TodoViewModel(ref);
});

class TodoViewModel extends StateNotifier<AsyncValue<ToDoModel>> {
  Ref ref;
  TodoViewModel(this.ref) : super(const AsyncLoading()) {
    getTodos();
  }

  getTodos() async {
    state = const AsyncLoading();
    final result = await ref.read(todoServiceProvider).getTodos();
    state = AsyncValue.data(result);
  }

  addTodo(Todos todos) {
    state = AsyncValue.data(ToDoModel(todos: [...?state.value?.todos, todos]));
  }

  removeTodo(Todos todos) {
    state = AsyncValue.data(ToDoModel(
        todos: [...?state.value?.todos?.where((element) => element != todos)]));
  }

  updateTodo(Todos todos, Todos updatedNewTodo) {
    final todoList = <Todos>[];
    for (int i = 0; i < state.value!.todos!.length; i++) {
      if (state.value!.todos![i].id == todos.id) {
        todoList.add(updatedNewTodo);
      } else {
        todoList.add(state.value!.todos![i]);
      }
    }

    state = AsyncValue.data(ToDoModel(todos: todoList));
  }
}
