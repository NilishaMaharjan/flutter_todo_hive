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
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: const Color(0xFFFFF5F6), 
      title: const Center(
        child: Text(
          "New Task",
          style: TextStyle(
            color: Color(0xFF8B1E3F),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      content: SizedBox(
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
        //get user input
        TextField(
          controller:controller ,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Add a new task",
           hintStyle: const TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFFF5D93)),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFFF5D93)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

          //buttons-> save + cancel
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            //save button 
          Expanded(
                  child: SizedBox(
                    height: 45,
                    child: Button(
                      text: "Save",
                      color: Color(0xFFFF7A8A),
                      onPressed: onSave,
                    ),
                  ),
            ),
          const SizedBox(width:15),
            //cancel button 
         Expanded(
                  child: SizedBox(
                    height: 45,
                    child: Button(
                      text: "Cancel",
                      color: Color(0xFFFF7A8A),
                      onPressed: onCancel,
                    ),
                  ),
            ),
          ],
          ),
       ],
        ),),
    );
  }
}