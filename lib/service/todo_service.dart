import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_mvvm_crud/core/retrofit/rest_client.dart';
import 'package:riverpod_mvvm_crud/core/retrofit/retrobase.dart';
import 'package:riverpod_mvvm_crud/model/todo_model.dart';

class ToDoService {
  Future<ToDoModel> getTodos() async {
    return RestClient(RetroBase().dioData()).getTodos();
  }
}

final todoServiceProvider = Provider<ToDoService>((ref) => ToDoService());
