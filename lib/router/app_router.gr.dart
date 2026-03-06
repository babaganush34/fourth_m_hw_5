// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:fourth_m_hw_5/data/models/todo_model.dart' as _i9;
import 'package:fourth_m_hw_5/ui/auth/auth_page.dart' as _i1;
import 'package:fourth_m_hw_5/ui/create_todo/create_todo_page.dart' as _i2;
import 'package:fourth_m_hw_5/ui/detail_todo/presentation/detail_todo_page.dart'
    as _i3;
import 'package:fourth_m_hw_5/ui/list_todo/presentation/list_todo_page.dart'
    as _i4;
import 'package:fourth_m_hw_5/ui/settings_page/presentation/settings_page.dart'
    as _i5;
import 'package:fourth_m_hw_5/ui/update_todo/presentation/update_todo_page.dart'
    as _i6;

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i7.PageRouteInfo<void> {
  const AuthRoute({List<_i7.PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthPage();
    },
  );
}

/// generated route for
/// [_i2.CreateTodoPage]
class CreateTodoRoute extends _i7.PageRouteInfo<void> {
  const CreateTodoRoute({List<_i7.PageRouteInfo>? children})
    : super(CreateTodoRoute.name, initialChildren: children);

  static const String name = 'CreateTodoRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.CreateTodoPage();
    },
  );
}

/// generated route for
/// [_i3.DetailTodoPage]
class DetailTodoRoute extends _i7.PageRouteInfo<DetailTodoRouteArgs> {
  DetailTodoRoute({
    _i8.Key? key,
    required int todoId,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         DetailTodoRoute.name,
         args: DetailTodoRouteArgs(key: key, todoId: todoId),
         initialChildren: children,
       );

  static const String name = 'DetailTodoRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailTodoRouteArgs>();
      return _i3.DetailTodoPage(key: args.key, todoId: args.todoId);
    },
  );
}

class DetailTodoRouteArgs {
  const DetailTodoRouteArgs({this.key, required this.todoId});

  final _i8.Key? key;

  final int todoId;

  @override
  String toString() {
    return 'DetailTodoRouteArgs{key: $key, todoId: $todoId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DetailTodoRouteArgs) return false;
    return key == other.key && todoId == other.todoId;
  }

  @override
  int get hashCode => key.hashCode ^ todoId.hashCode;
}

/// generated route for
/// [_i4.ListTodoPage]
class ListTodoRoute extends _i7.PageRouteInfo<void> {
  const ListTodoRoute({List<_i7.PageRouteInfo>? children})
    : super(ListTodoRoute.name, initialChildren: children);

  static const String name = 'ListTodoRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.ListTodoPage();
    },
  );
}

/// generated route for
/// [_i5.SettingsPage]
class SettingsRoute extends _i7.PageRouteInfo<void> {
  const SettingsRoute({List<_i7.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.SettingsPage();
    },
  );
}

/// generated route for
/// [_i6.UpdateTodoPage]
class UpdateTodoRoute extends _i7.PageRouteInfo<UpdateTodoRouteArgs> {
  UpdateTodoRoute({
    _i8.Key? key,
    required _i9.TodoModel todoModel,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         UpdateTodoRoute.name,
         args: UpdateTodoRouteArgs(key: key, todoModel: todoModel),
         initialChildren: children,
       );

  static const String name = 'UpdateTodoRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UpdateTodoRouteArgs>();
      return _i6.UpdateTodoPage(key: args.key, todoModel: args.todoModel);
    },
  );
}

class UpdateTodoRouteArgs {
  const UpdateTodoRouteArgs({this.key, required this.todoModel});

  final _i8.Key? key;

  final _i9.TodoModel todoModel;

  @override
  String toString() {
    return 'UpdateTodoRouteArgs{key: $key, todoModel: $todoModel}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UpdateTodoRouteArgs) return false;
    return key == other.key && todoModel == other.todoModel;
  }

  @override
  int get hashCode => key.hashCode ^ todoModel.hashCode;
}
