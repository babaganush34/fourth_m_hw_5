import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_m_hw_5/data/api/api_todos.dart';
import 'package:fourth_m_hw_5/state/bloc/todo_bloc.dart';

@RoutePage()
class DetailTodoPage extends StatefulWidget {
  const DetailTodoPage({super.key, required this.todoId});

  final int todoId;

  @override
  State<StatefulWidget> createState() => _DetailTodoPage();
}

class _DetailTodoPage extends State<DetailTodoPage> {
  final TodoBloc _todoBloc = TodoBloc(TodoApiService());

  @override
  void initState() {
    _todoBloc.add(GetTodoByIdEvent(id: widget.todoId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: BlocBuilder<TodoBloc, TodoState>(
          bloc: _todoBloc,
          builder: (context, state) {
            if (state is LoadedTodoState) {
              final model = state.todoModel;
              return Column(
                children: [
                  Row(
                    children: [
                      Text('Todo Name: '),
                      Text(
                        model.todo,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('User ID: '),
                      Text(
                        model.userId.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Todo ID: '),
                      Text(
                        model.id.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        model.completed ? 'Done' : 'Not Done',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Checkbox(value: model.completed, onChanged: null),
                    ],
                  ),
                ],
              );
            }
            if (state is ErrorTodoState) {
              return Text(
                'ОШИБКА',
                style: TextStyle(fontSize: 40, color: Colors.red),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
