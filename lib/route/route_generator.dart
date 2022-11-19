import 'package:flutter/material.dart';
import 'package:tasks_provider_sqflit/screens/add_task.dart';
import 'package:tasks_provider_sqflit/screens/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/add_task':
        return MaterialPageRoute(
          builder: (_) => const AddTaskScreen(),
        );
      default:
        return ErrorRoute();
    }
  }

  static Route<dynamic> ErrorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('There is no route'),
            centerTitle: true,
          ),
          body: Center(
            child: Text(
              'Sorry Error has happend There is no route find Restart the App ',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
          ),
        );
      },
    );
  }
}
