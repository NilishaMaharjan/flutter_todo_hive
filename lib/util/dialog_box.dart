import 'package:flutter/material.dart';
import 'button.dart';

class DialogBox extends StatelessWidget{
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key, 
    required this.controller,
    required this.onSave,
    required this.onCancel,});

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 250, 123, 166),
      content: Container(
       height: 120 ,
       child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        //get user input
        TextField(
          controller:controller ,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Add a new task",
          ),
          ),

          //buttons-> save + cancel
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            //save button 
          Button(
            text: "Save",
             onPressed: onSave,
            color: Color(0xFFFF5D93),),
          const SizedBox(width:5),
            //cancel button 
          Button(text: "Cancel", onPressed: onCancel,color: Color(0xFFFF5D93),)
          ],
          ),
       ],
        ),),
    );
  }
}