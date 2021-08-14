import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/todo.dart';
import 'package:flutter_app/provider/todos.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_app/page/edit_todo_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({
    required this.todo,
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(6),
    child: Slidable(
      actionPane: SlidableDrawerActionPane(),
      key:Key(todo.id),
      actions: [
        IconSlideAction(
          color:Colors.orange,
          onTap: () => editTodo(context, todo),
          caption: '編輯',
          icon: Icons.edit,
          foregroundColor: Colors.white,
        )
      ],
      child: buildTodo(context),
    ),
  );

  Widget buildTodo(BuildContext context) => Container(
    color: Colors.white,
    padding: EdgeInsets.all(20),
    child:Row(
      children: [
        // Checkbox(
        //   activeColor: Theme.of(context).primaryColor,
        //   checkColor: Colors.white,
        //   value: todo.isDone,
        //   onChanged: (_){},
        // ),
        Expanded(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      // color:Theme.of(context).primaryColor,
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

                    ),
                  Spacer(),
                  Container(
                    child:IconButton(
                      icon: Icon(Icons.delete,
                          color: Colors.redAccent,
                          size: 28),
                      onPressed: () => delete(context, todo),
                    ),
                  ),
                ],
              ),

            ],
          ),
        )
      ],
    )
  );
  //delete
  void delete(BuildContext context, Todo todo){
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, '刪除成功!');
  }

  //update
  void editTodo(BuildContext context, Todo todo) => Navigator.of(context).push(

    MaterialPageRoute(builder: (context) => EditTodoPage(todo: todo),
    ),
  );
}
