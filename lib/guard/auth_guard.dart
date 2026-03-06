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
    bool auth = await _checkUser();
    if (!auth) {
      resolver.next(true);
    } else {
      router.push(ListTodoRoute());
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
