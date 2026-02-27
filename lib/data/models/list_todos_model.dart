import 'package:equatable/equatable.dart';
import 'package:fourth_m_hw_5/data/models/todo_model.dart';

class ListTodosModel extends Equatable {
  const ListTodosModel({required this.todos, required this.total});

  final List<TodoModel> todos;
  final int total;

  factory ListTodosModel.fromJson(Map<String, dynamic> json) {
    List<TodoModel> todoList = [];
    for (var item in json['todos']) {
      todoList.add(TodoModel.fromJson(item));
    }
    return ListTodosModel(todos: todoList, total: json['total']);
  }

  @override
  List<Object?> get props => [todos];
}