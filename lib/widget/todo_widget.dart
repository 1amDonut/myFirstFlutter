import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({
    required this.todo,
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Slidable(
      actionPane: SlidableDrawerActionPane(),
      key:Key(todo.id),
      actions: [
        IconSlideAction(
          color:Colors.orange,
          onTap: () {},
          caption: '編輯',
          icon: Icons.edit,
        )
      ],
      child: buildTodo(context),
    ),
  );

  Widget buildTodo(BuildContext context) => Container(
    child:Row(
      children: [
        Checkbox(
          activeColor: Theme.of(context).primaryColor,
          checkColor: Colors.white,
          value: todo.isDone,
          onChanged: (_){},
        ),
        Expanded(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:Theme.of(context).primaryColor,
                  fontSize: 22,
                ),
              ),
              if (todo.description.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(
                    todo.description,
                    style: TextStyle(fontSize: 20, height: 1.5),
                  ),
                )
            ],
          ),
        )
      ],
    )
  );
}
