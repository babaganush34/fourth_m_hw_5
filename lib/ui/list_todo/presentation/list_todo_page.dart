import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fourth_m_hw_5/data/api/api_todos.dart';
import 'package:fourth_m_hw_5/data/models/todo_model.dart';
import 'package:fourth_m_hw_5/router/app_router.gr.dart';
import 'package:fourth_m_hw_5/state/bloc/todo_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ListTodoPage extends StatefulWidget {
  const ListTodoPage({super.key});

  @override
  State<StatefulWidget> createState() => _ListTodoPageState();
}

class _ListTodoPageState extends State<ListTodoPage> {
  final TodoBloc _todoBloc = TodoBloc(TodoApiService());

  @override
  void initState() {
    _todoBloc.add(GetAllTodosEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.pushRoute(SettingsRoute());
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<TodoBloc, TodoState>(
          bloc: _todoBloc,
          builder: (context, state) {
            if (state is LoadedAllTodosState) {
              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.listTodosModel.todos.length,
                itemBuilder: (context, index) {
                  final todo = state.listTodosModel.todos[index];
                  return InkWell(
                    onLongPress: () {
                      context.pushRoute(UpdateTodoRoute(todoModel: todo));
                    },
                    onTap: () {
                      if (todo.id != null) {
                        context.pushRoute(DetailTodoRoute(todoId: todo.id!));
                      }
                    },
                    child: Row(
                      children: [
                        Expanded(child: Text(todo.todo)),
                        Checkbox(value: todo.completed, onChanged: (value) {}),
                      ],
                    ),
                  );
                },
              );
            }
            if (state is ErrorTodoState) {
              return Center(
                child: TextButton(
                  onPressed: () {
                    _todoBloc.add(GetAllTodosEvent());
                  },
                  child: Text(
                    'ОШИБКА',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              );
            }
            if (state is LoadingTodoState) {
              return Center(child: CircularProgressIndicator());
            }
            return Text('');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        onPressed: () async {
          final TodoModel? todoModel = await context.pushRoute(
            CreateTodoRoute(),
          );
          if (todoModel != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${todoModel.todo} ${todoModel.completed}'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
      ),
    );
  }
}
