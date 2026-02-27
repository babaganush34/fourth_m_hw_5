import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  const TodoModel({
    this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  final int? id;
  final String todo;
  final bool completed;
  final int userId;

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      todo: json['todo'],
      completed: json['completed'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"todo": todo, "completed": completed, "userId": userId};
  }

  @override
  List<Object?> get props => [id, todo, completed, userId];
}
