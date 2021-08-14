import 'package:flutter/material.dart';
import 'package:flutter_app/model/todo.dart';

class TodosProvider extends ChangeNotifier{
  List<Todo> _todos = [
    Todo(
      id: '1',
      createdTime: DateTime.now(),
      title: 'this is a message',
    ),
    Todo(
      id: '2',
      createdTime: DateTime.now(),
      title: 'this is a message',
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  void addTodo(Todo todo){
    _todos.add(todo);

    notifyListeners();
  }
  void removeTodo(Todo todo){
      _todos.remove(todo);

      notifyListeners();
  }

  void updateTodo(Todo todo, String title, String description){
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}

