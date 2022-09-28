import 'package:flutter/material.dart';
import 'Todo_inputs.dart';
import 'home.dart';
class Todo_item extends StatelessWidget {
  final Todo_inputs todo;
  final onToDoChanged;
  final delete;
  const Todo_item({Key? key, required this.todo,required this.delete, required this.onToDoChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        onTap:() {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.status? Icons.check_box: Icons.check_box_outline_blank,
          color: Colors.black,
        ),
        title: Text(
            todo.Text!,
             style: TextStyle(fontSize: 15,
             decoration: todo.status? TextDecoration.lineThrough :null,
               color: Colors.black,
             ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
               color: Colors.white ,
               iconSize: 15,
            icon: Icon(
              Icons.delete,
              size: 20,
            ),
            onPressed: (){
               delete(todo.id);
            },
          )

        ),

      ),
    );
  }
}
