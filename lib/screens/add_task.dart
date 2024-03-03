import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  final Function(String) onTaskAdded;

  AddTaskScreen({required this.onTaskAdded});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late TextEditingController _taskController;

  @override
  void initState() {
    super.initState();
    _taskController = TextEditingController();
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _taskController,
              decoration: InputDecoration(labelText: 'Task'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String task = _taskController.text.trim();
                if (task.isNotEmpty) {
                  widget.onTaskAdded(task);
                  Navigator.pop(context); // Close the AddTaskScreen
                }
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
