import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks {
    return [..._tasks];
  }

  void updateTaskStatus(String taskId, bool isDone) {
    final taskIndex = _tasks.indexWhere((task) => task.id == taskId);
    if (taskIndex != -1) {
      _tasks[taskIndex].isDone = isDone;
      notifyListeners(); // Notify listeners to update UI
    }
  }
  
  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(int index, Task newTask) {
    if (index >= 0 && index < _tasks.length) {
      _tasks[index] = newTask;
      notifyListeners();
    }
  }

  void deleteTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks.removeAt(index);
      notifyListeners();
    }
  }
}
