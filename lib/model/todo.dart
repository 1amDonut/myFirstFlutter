import 'package:flutter/cupertino.dart';
import 'package:flutter_app/utils.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  Todo({
    required this.createdTime,
    required this.title,
    this.description = '',
    required this.id,
    this.isDone = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json){
    return Todo(
        createdTime: Utils.toDateTime(json['createTime']),
        title: json['title'],
        description: json['description'],
        id: json['id'],
        isDone: json['isDone'],
    );
  }
  // static Todo fromJson(Map<String, dynamic> json) => Todo(
  //   createdTime: Utils.toDateTime(json['createdTime']),
  //   title: json['title'],
  //   description: json['description'],
  //   id: json['id'],
  //   isDone: json['isDone'],
  // );

  Map<String, dynamic> toJson() => {
    'createTime':Utils.fromDateTimeToJson(createdTime),
    'title':title,
    'description':description,
    'id':id,
    'isDone':isDone,
  };

  Map<String, dynamic> toMap(){
    return {
      'title':title,
      'id':id,
      'description':description,
    };
  }

  // Todo.fromMap(Map snapshot,String id) :
  //       id = id ?? '',
  //       title = snapshot['title'] ?? '',
  //       description = snapshot['description'],
  //       createdTime = snapshot['createTime'],
  //       isDone = snapshot['isDone'];
}