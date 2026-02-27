import 'package:flutter/material.dart';
import 'package:fourth_m_hw_5/data/api/api_todos.dart';
import 'package:fourth_m_hw_5/ui/create_todo/create_todo_page.dart';
import 'package:fourth_m_hw_5/ui/detail_todo/presentation/detail_todo_page.dart';
import 'package:fourth_m_hw_5/ui/bloc/todo_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_m_hw_5/ui/settings_page/presentation/settings_page.dart';
import 'package:fourth_m_hw_5/ui/update_todo/presentation/update_todo_page.dart';

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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SettingsPage()),
              );
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => UpdateTodoPage(todoModel: todo),
                        ),
                      );
                    },
                    onTap: () {
                      if (todo.id != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailTodoPage(todoId: todo.id!),
                          ),
                        );
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateTodoPage()),
          );
        },
      ),
    );
  }
}
