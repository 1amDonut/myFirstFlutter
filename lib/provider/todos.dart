import 'package:flutter/material.dart';
import 'package:flutter_app/api/firebase_api.dart';
import 'package:flutter_app/model/todo.dart';

class TodosProvider extends ChangeNotifier{
  List<Todo> _todos = [];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  void addTodo(Todo todo) => FirebaseApi.createTodo(todo);

  void removeTodo(Todo todo){
      _todos.remove(todo);

      FirebaseApi.Delete(todo);
      // notifyListeners();
  }

  void updateTodo(Todo todo, String title, String description){
    todo.title = title;
    todo.description = description;

    FirebaseApi.updateTodo(todo);
    // notifyListeners();
  }

  void setTodos(List<Todo> todos) =>
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _todos = todos;
        notifyListeners();
      });

}

