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
              backgroundColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(16),)
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          decoration: BoxDecoration(
            color: Color(0xFFFFF0F2),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF7A8A).withOpacity(0.2), // subtle pink shadow
                blurRadius: 2,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
         child: Row(
            children: [
              // Custom circle checkbox look
              GestureDetector(
                onTap: () => onChanged?.call(!taskCompleted),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFFF7B89),
                      width: 2,
                    ),
                    color: taskCompleted
                        ? const Color(0xFFFF7B89)
                        : Colors.transparent,
                  ),
                  child: taskCompleted
                      ? const Icon(Icons.check,
                          size: 16, color: Colors.white)
                      : null,
                ),
              ),

              const SizedBox(width: 14),
        
              //task name
              Text(
                taskName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        :TextDecoration.none,
                  ),
                ),
          ],
        ),
            ),
      ),
    );
  }
}