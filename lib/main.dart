import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task.dart';
import 'screens/home_screen.dart';
import 'screens/add_task.dart';
import 'providers/task_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/add-task': (context) => AddTaskScreen(
            onTaskAdded: (taskTitle) {
              Provider.of<TaskProvider>(context, listen: false).addTask(
                Task(
                  id: DateTime.now().toString(),
                  title: taskTitle,
                ),
              );
            },
          ),
        },
      ),
    );
  }
}
