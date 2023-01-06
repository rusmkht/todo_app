// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../models/todo.dart' as _i7;
import '../screens/add_todo_screen/add_todo_screen.dart' as _i4;
import '../screens/edit_todo_screen/edit_todo_screen.dart' as _i3;
import '../screens/home_page/home_page.dart' as _i1;
import '../screens/main_screen/main_screen.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomePage.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i2.MainScreen()),
      );
    },
    EditToDoRoute.name: (routeData) {
      final args = routeData.argsAs<EditToDoRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.EditToDoScreen(
          key: args.key,
          toDo: args.toDo,
        ),
      );
    },
    AddToDoRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.AddToDoScreen(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          HomePage.name,
          path: '/',
        ),
        _i5.RouteConfig(
          MainRoute.name,
          path: 'mainScreen',
          children: [
            _i5.RouteConfig(
              AddToDoRoute.name,
              path: 'addToDoScreen',
              parent: MainRoute.name,
            )
          ],
        ),
        _i5.RouteConfig(
          EditToDoRoute.name,
          path: 'editToDoScreen',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomePage extends _i5.PageRouteInfo<void> {
  const HomePage()
      : super(
          HomePage.name,
          path: '/',
        );

  static const String name = 'HomePage';
}

/// generated route for
/// [_i2.MainScreen]
class MainRoute extends _i5.PageRouteInfo<void> {
  const MainRoute({List<_i5.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: 'mainScreen',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.EditToDoScreen]
class EditToDoRoute extends _i5.PageRouteInfo<EditToDoRouteArgs> {
  EditToDoRoute({
    _i6.Key? key,
    required _i7.ToDo? toDo,
  }) : super(
          EditToDoRoute.name,
          path: 'editToDoScreen',
          args: EditToDoRouteArgs(
            key: key,
            toDo: toDo,
          ),
        );

  static const String name = 'EditToDoRoute';
}

class EditToDoRouteArgs {
  const EditToDoRouteArgs({
    this.key,
    required this.toDo,
  });

  final _i6.Key? key;

  final _i7.ToDo? toDo;

  @override
  String toString() {
    return 'EditToDoRouteArgs{key: $key, toDo: $toDo}';
  }
}

/// generated route for
/// [_i4.AddToDoScreen]
class AddToDoRoute extends _i5.PageRouteInfo<void> {
  const AddToDoRoute()
      : super(
          AddToDoRoute.name,
          path: 'addToDoScreen',
        );

  static const String name = 'AddToDoRoute';
}
