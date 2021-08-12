import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget{
 final String title;
 final String description;
 final ValueChanged<String> onChangedTitle;
 final ValueChanged<String> onChangedDescription;
 final VoidCallback onSavedTodo;

 const TodoFormWidget({
   Key ?key,
   this.title = '',
   this.description = '',
   required this.onChangedTitle,
   required this.onChangedDescription,
   required this.onSavedTodo,
 }) : super(key: key);


 @override
 Widget build(BuildContext context) => SingleChildScrollView(
   child: Column(
     mainAxisSize: MainAxisSize.min,
     children: [
        buildTitle(),
        SizedBox(height: 32),
        buildButton(),
     ],
   ),
 );

 Widget buildTitle() => TextFormField(
   decoration: InputDecoration(
     border: UnderlineInputBorder(),
     labelText: '標題',
   ),
 );
 
 Widget buildButton() => SizedBox(
   width: double.infinity,
   child: ElevatedButton(
     style: ButtonStyle(
       backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
     ),
     onPressed: onSavedTodo,
     child: Text('儲存'),
   ),
 );
}