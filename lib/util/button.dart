import 'package:flutter/material.dart';

class Button extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    });

  @override
  Widget build(BuildContext context){
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      textColor: Colors.white, 
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), 
      ),
      child: Text(text),
    );
  }
}