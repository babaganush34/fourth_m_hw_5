part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

final class GetAllTodosEvent extends TodoEvent {}

final class GetTodoByIdEvent extends TodoEvent {
  const GetTodoByIdEvent({required this.id});

  final int id;

  @override
  List<Object> get props => [id];
}

final class CreateTodoEvent extends TodoEvent {
  const CreateTodoEvent({required this.todoModel});

  final TodoModel todoModel;

  @override
  List<Object> get props => [todoModel];
}

final class UpdateTodoEvent extends TodoEvent {
  const UpdateTodoEvent({required this.todoModel});

  final TodoModel todoModel;

  @override
  List<Object> get props => [todoModel];
}
