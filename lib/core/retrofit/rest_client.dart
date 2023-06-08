import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_mvvm_crud/model/todo_model.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://dummyjson.com')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/todos')
  Future<ToDoModel> getTodos();
}
