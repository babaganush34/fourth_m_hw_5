import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fourth_m_hw_5/data/api/firebase_helper.dart';
import 'package:fourth_m_hw_5/router/app_router.gr.dart';
import 'package:fourth_m_hw_5/ui/list_todo/presentation/list_todo_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final FirebaseHelper firebaseHelper = FirebaseHelper(
    googleSignIn: GoogleSignIn.instance,
  );

  @override
  void initState() {
    // _checkUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            var userData = await firebaseHelper.signInWithGoogle();
            if (userData != null) {
              _pushListTodo(context);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('ОШИБКА'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ListTodoPage()),
            );
          },
          child: Text('LOGIN'),
        ),
      ),
    );
  }

  void _pushListTodo(BuildContext context) {
    context.router.replaceAll([ListTodoRoute()]);
  }
}
