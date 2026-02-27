import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fourth_m_hw_5/data/api/api_todos.dart';
import 'package:fourth_m_hw_5/data/models/list_todos_model.dart';
import 'package:fourth_m_hw_5/data/models/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc(this._apiService) : super(TodoInitial()) {
    on<GetAllTodosEvent>(_getAllTodos);
    on<GetTodoByIdEvent>(_getTodoById);
    on<CreateTodoEvent>(_createTodo);
    on<UpdateTodoEvent>(_updateTodo);
  }

  final TodoApiService _apiService;

  Future<void> _getAllTodos(
    GetAllTodosEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(LoadingTodoState());
    try {
      final ListTodosModel listTodosModel = await _apiService.getListTodo();
      emit(LoadedAllTodosState(listTodosModel: listTodosModel));
    } catch (exception, stackTrace) {
      print(exception);
      print(stackTrace);
      emit(ErrorTodoState());
    }
  }

  Future<void> _getTodoById(
    GetTodoByIdEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(LoadingTodoState());
    try {
      final TodoModel todoModel = await _apiService.getTodo(id: event.id);
      emit(LoadedTodoState(todoModel: todoModel));
    } catch (exception, stackTrace) {
      print(exception);
      print(stackTrace);
      emit(ErrorTodoState());
    }
  }

  Future<void> _createTodo(
    CreateTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(LoadingTodoState());
    try {
      final TodoModel todoModel = await _apiService.createTodo(
        createTodoModel: event.todoModel,
      );
      emit(SuccessCreateTodoState(todoModel: todoModel));
    } catch (exception, stackTrace) {
      print(exception);
      print(stackTrace);
      emit(ErrorTodoState());
    }
  }

  Future<void> _updateTodo(
    UpdateTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(LoadingTodoState());
    try {
      final TodoModel todoModel = await _apiService.updateTodo(
        todoModel: event.todoModel,
      );
      emit(SuccessUpdateTodoState(todoModel: todoModel));
    } catch (exception, stackTrace) {
      print(exception);
      print(stackTrace);
      emit(ErrorTodoState());
    }
  }
}
