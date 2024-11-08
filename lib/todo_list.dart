import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class TodoList extends StatelessWidget {
  const TodoList({super.key, this.taskName, this.taskCompleted, this.onChanged, this.deleteFunction});
  final taskName;
  final taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(20,20,20,0),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                  onPressed:deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(20),
                
              )
            ]
        ),
        child: Container(
          decoration:BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(20)
          ),
          padding: EdgeInsets.all(25),
        
          child: Row(
            children: [
              Checkbox(value: taskCompleted,
                onChanged: onChanged,
                checkColor: Colors.black,
                activeColor: Colors.red,
                side: BorderSide(
                  color: Colors.grey,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
        
        
              ),
              Text(
                taskName,
                style: TextStyle(
                  color: Colors.grey[350],
                  fontSize: 18,
                  decoration:taskCompleted? TextDecoration.lineThrough : TextDecoration.none,
                    decorationColor: Colors.white,
                    decorationThickness: 2,
                ),
              ),
            ],
          ),
        
        ),
      ),
    );
  }
}
