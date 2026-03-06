import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fourth_m_hw_5/router/app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  FutureOr<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    bool isAuth = await _checkUser();
    if (isAuth) {
      router.push(ListTodoRoute());
    } else {
      resolver.next(true);
    }
  }

  Future<bool> _checkUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return true;
    }
    return false;
  }
}
