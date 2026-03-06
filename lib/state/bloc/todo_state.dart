part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoInitial extends TodoState {}

final class LoadingTodoState extends TodoState {}

final class ErrorTodoState extends TodoState {}

final class LoadedAllTodosState extends TodoState {
  const LoadedAllTodosState({required this.listTodosModel});

  final ListTodosModel listTodosModel;

  @override
  List<Object> get props => [listTodosModel];
}

final class LoadedTodoState extends TodoState {
  const LoadedTodoState({required this.todoModel});

  final TodoModel todoModel;

  @override
  List<Object> get props => [todoModel];
}

final class SuccessCreateTodoState extends TodoState {
  const SuccessCreateTodoState({required this.todoModel});

  final TodoModel todoModel;

  @override
  List<Object> get props => [todoModel];
}

final class SuccessUpdateTodoState extends TodoState {
  const SuccessUpdateTodoState({required this.todoModel});

  final TodoModel todoModel;

  @override
  List<Object> get props => [todoModel];
}
