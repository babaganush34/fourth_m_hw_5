import 'package:dio/dio.dart';
import 'package:fourth_m_hw_5/data/models/list_todos_model.dart';
import 'package:fourth_m_hw_5/data/models/todo_model.dart';

final class TodoApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));

  Future<ListTodosModel> getListTodo() async {
    final response = await _dio.get('/todos');
    final ListTodosModel listTodoModel = ListTodosModel.fromJson(response.data);
    return listTodoModel;
  }

  Future<TodoModel> getTodo({required int id}) async {
    final Response response = await _dio.get('/todos/$id');
    final TodoModel todoModel = TodoModel.fromJson(response.data);
    return todoModel;
  }

  Future<TodoModel> createTodo({required TodoModel createTodoModel}) async {
    final Response response = await _dio.post(
      '/todos/add',
      data: createTodoModel.toJson(),
    );
    final TodoModel todoModel = TodoModel.fromJson(response.data);
    return todoModel;
  }

  Future<TodoModel> updateTodo({required TodoModel todoModel}) async {
    final Response response = await _dio.put(
      '/todos/${todoModel.id}',
      data: todoModel.toJson(),
    );
    final TodoModel updateTodo = TodoModel.fromJson(response.data);
    return updateTodo;
  }
}
