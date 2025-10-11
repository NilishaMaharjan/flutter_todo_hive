import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget{
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  const ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding:EdgeInsets.only(left:22, right:22, top:22),
      
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),)
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(18),
          child: Row(
          children: [
            //checkbox
            Checkbox(value: taskCompleted, onChanged: onChanged),
              
        
              //task name
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted
                  ? TextDecoration.lineThrough
                  :TextDecoration.none,
                  ),
                ),
          ],
        ),
              decoration: BoxDecoration(
                color:  const Color.fromARGB(255, 255, 93, 147),
                borderRadius: BorderRadius.circular(5),
                
             ),
            ),
      ),
    );
  }
}