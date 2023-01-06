import 'package:auto_route/auto_route.dart';
import 'package:todo_app/screens/add_todo_screen/add_todo_screen.dart';
import 'package:todo_app/screens/edit_todo_screen/edit_todo_screen.dart';
import 'package:todo_app/screens/home_page/home_page.dart';
import 'package:todo_app/screens/main_screen/main_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: HomePage,
    ),
    AutoRoute(
      path: 'mainScreen',
      page: MainScreen,
      children: [
        AutoRoute(
          page: AddToDoScreen,
          path: 'addToDoScreen',
        ),
      ],
    ),
    AutoRoute(
      page: EditToDoScreen,
      path: 'editToDoScreen',
    )
  ],
)
class $AppRouter {}
