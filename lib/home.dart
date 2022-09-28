import 'package:flutter/material.dart';
import 'to_do.dart';
import 'Todo_inputs.dart';
class todo extends StatefulWidget {
   todo({Key? key}) : super(key: key);

  @override
  State<todo> createState() => _todoState();
}

class _todoState extends State<todo> {
  final todolist= Todo_inputs.todolist();
  final controller_1=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Row(
          children: <Widget>[
            Icon(
              Icons.menu,
              color: Colors.grey,
              size:30,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 20,
                      ),
                      prefixIconConstraints: BoxConstraints(
                        maxHeight: 20,
                        minHeight: 20,
                      ),
                      border: InputBorder.none,
                      hintText:'Search your task here',
                      hintStyle: TextStyle(color: Colors.black)
                    ),
                  ),
                ),
                Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top:25,bottom: 15),
                          child: Text('Your To Do List', style: TextStyle(
                            fontSize: 30,
                              color: Colors.white,
                          ),
                          ),
                        ),
                      for(Todo_inputs todos in todolist )
                        Todo_item(todo: todos,
                          onToDoChanged: todochange,
                          delete: onDelete,
                        ),

                      ],
                    ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20,right: 20,left: 20,),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [BoxShadow(
                        color:Colors.black,
                        offset: Offset(0,0),
                        blurRadius: 10,
                        spreadRadius: 0,
                      ),],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: controller_1,
                      decoration: InputDecoration(
                        hintText: 'Type a new task',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 40, top: 20,right: 10),
                  child: ElevatedButton(
                    child: Text('+',style: TextStyle(fontSize: 35),
                    ),
                    onPressed: (){
                      add_item(controller_1.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      minimumSize: Size(70, 60),
                      elevation: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void todochange(Todo_inputs todo){
    setState(() {
      todo.status=!todo.status;
    });
  }
  void onDelete(String id) {
    setState(() {
      todolist.removeWhere((item) => item.id == id);
    });
  }
    void add_item(String to_do){
     setState(() {
       todolist.add(Todo_inputs(id: DateTime.now().millisecondsSinceEpoch.toString(), Text:to_do ));
     });
     controller_1.clear();
    }
}




