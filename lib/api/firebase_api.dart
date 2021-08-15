import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/model/todo.dart';
import 'package:flutter_app/utils.dart';

class FirebaseApi {
  static Future<String> createTodo(Todo todo) async {

    final docTodo = FirebaseFirestore.instance.collection('todo').doc();

    todo.id = docTodo.id;
    await docTodo.set(todo.toJson(), SetOptions(merge: true));

    return docTodo.id;
  }

  // static Stream<List<Todo>> readTodos() => FirebaseFirestore.instance
  //     .collection('todo')
  //     .orderBy(TodoField.createdTime, descending: true)
  //     .snapshots()
  //     .transform(Utils.transformer(Todo.fromJson));

  static Stream<QuerySnapshot> readItems() => FirebaseFirestore.instance
        .collection('Test')
        .snapshots();
  
  // Stream<List<Todo>> getEntries(){
  //   return _db.collection('todo').snapshots()
  //       .map((snapshot) => snapshot.docs.map((doc) => Todo.fromJson(doc.data())))
  // }
  //Get Entries
  static Stream<List<Todo>> getEntries(){

    FirebaseFirestore _db = FirebaseFirestore.instance;
    var list = _db
        .collection('todo')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Todo.fromJson(doc.data()))
        .toList());

    return list;
  }

  // static Stream<List<Todo>> getEntries() =>FirebaseFirestore.instance
  //       .collection('todo')
  //       .snapshots()
  //       .map((snapshot) => snapshot.docs
  //       .map((doc) => Todo.fromJson(doc.data()))
  //       .toList());

}