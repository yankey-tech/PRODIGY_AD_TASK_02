import 'package:flutter/material.dart';
import 'package:todo/todo_list.dart';

class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final newcontroller = TextEditingController();

  final List todoList=[

  ];

  void checkboxChanged(int index){
      setState(() {
        todoList[index][1] =! todoList[index][1];
      });
  }

  void newTodo(){
    setState(() {
      todoList.add([newcontroller.text,false]);
      newcontroller.clear();

    });
  }

  void deleteTask(int index){
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('Todo',
        style: TextStyle(
            fontSize: 30.0,
          color:Colors.grey[300],
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
          itemCount:todoList.length,
          itemBuilder: (BuildContext context,index){
        return TodoList(
          taskName: todoList[index][0],
          taskCompleted: todoList[index][1],
          onChanged: (value)=> checkboxChanged(index),
          deleteFunction: (value) => deleteTask(index),
        );
      }
      ),
        floatingActionButton: Row(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: TextField(
                    controller:newcontroller ,
                    decoration: InputDecoration(
                      hintText: 'Add new todo',
                      filled: true,
                      fillColor: Colors.grey,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade900
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.shade900
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                )
            ),
            FloatingActionButton(
              onPressed:newTodo,
              child:Icon(Icons.add),
              backgroundColor: Colors.red,

            ),
          ],
        ),

    );
  }
}
