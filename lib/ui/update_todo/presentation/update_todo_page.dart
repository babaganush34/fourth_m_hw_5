import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_m_hw_5/data/api/api_todos.dart';
import 'package:fourth_m_hw_5/data/models/todo_model.dart';
import 'package:fourth_m_hw_5/state/bloc/todo_bloc.dart';

@RoutePage()
class UpdateTodoPage extends StatefulWidget {
  const UpdateTodoPage({super.key, required this.todoModel});
  final TodoModel todoModel;

  @override
  State<StatefulWidget> createState() => _UpdateTodoPageState();
}

class _UpdateTodoPageState extends State<UpdateTodoPage> {
  final TodoBloc _todoBloc = TodoBloc(TodoApiService());
  late final TextEditingController _textController;
  late bool _completed;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.todoModel.todo);
    _completed = widget.todoModel.completed;
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Todo')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: BlocConsumer(
          bloc: _todoBloc,
          listener: (context, state) {
            if (state is SuccessUpdateTodoState) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            if (state is LoadingTodoState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ErrorTodoState) {
              return const Center(
                child: Text(
                  'ОШИБКА',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      labelText: 'Todo',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _completed,
                        onChanged: (value) {
                          setState(() {});
                          _completed = value ?? false;
                        },
                      ),
                      SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                          _todoBloc.add(
                            UpdateTodoEvent(
                              todoModel: TodoModel(
                                id: widget.todoModel.id,
                                todo: _textController.text,
                                completed: _completed,
                                userId: widget.todoModel.userId,
                              ),
                            ),
                          );
                        },
                        child: Text('Update'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
