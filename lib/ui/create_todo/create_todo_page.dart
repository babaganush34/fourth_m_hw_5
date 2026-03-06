import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_m_hw_5/data/api/api_todos.dart';
import 'package:fourth_m_hw_5/data/models/todo_model.dart';
import 'package:fourth_m_hw_5/state/bloc/todo_bloc.dart';

@RoutePage()
class CreateTodoPage extends StatefulWidget {
  const CreateTodoPage({super.key});

  @override
  State<StatefulWidget> createState() => _CreateTodoPageState();
}

class _CreateTodoPageState extends State<CreateTodoPage> {
  final TodoBloc _todoBloc = TodoBloc(TodoApiService());
  final TextEditingController _textEditingController = TextEditingController();
  bool completed = false;
  late final TodoModel todoModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: BlocConsumer<TodoBloc, TodoState>(
          listener: (context, state) {
            if (state is SuccessCreateTodoState) {
              context.router.pop(true);
            }
          },
          bloc: _todoBloc,
          builder: (contex, state) {
            if (state is LoadingTodoState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is ErrorTodoState) {
              return Center(
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
                    controller: _textEditingController,
                    decoration: InputDecoration(),
                  ),
                  Checkbox(
                    value: completed,
                    onChanged: (value) {
                      completed = value ?? false;
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      _todoBloc.add(
                        CreateTodoEvent(
                          todoModel: TodoModel(
                            todo: _textEditingController.text,
                            completed: completed,
                            userId: 142,
                          ),
                        ),
                      );
                      todoModel = TodoModel(
                        todo: _textEditingController.text,
                        completed: completed,
                        userId: 142,
                      );
                    },
                    child: Text('Save'),
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
