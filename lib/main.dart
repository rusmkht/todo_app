import 'package:flutter/material.dart';
import 'package:todo_app/data/repository.dart';
import 'package:todo_app/routes/router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ToDosRepository().initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
