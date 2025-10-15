import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app_using_hive_local_storage/data/database.dart';
import 'package:to_do_app_using_hive_local_storage/util/dialog_box.dart';
import '../util/todo_tile.dart';
class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage>{
 //reference the hive box
 final _myBox = Hive.box('mybox');
 ToDoDataBase db = ToDoDataBase();

 @override
 void initState(){
  //if this is the 1st time ever opening the app, then create default data
  if(_myBox.get("TODOLIST")== null){
    db.createInitialData();
  }else{
    //there already exists data
    db.loadData();
  }


  super.initState();
 }
 //text controller
 final controller = TextEditingController();

  //checkbox was tapped
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1]=!db.toDoList[index][1];
    });
    db.updateDatabase();
  }

//save new task
  void saveNewTask(){
    setState(() {
      db.toDoList.add([controller.text, false]);
      controller.clear();
    });
    Navigator.of(context).pop();
  }

  //create a new task
  void createNewTask(){
    showDialog(
      context: context, 
      builder: (context){
        return DialogBox(
          controller: controller,
          onSave: saveNewTask,
          onCancel: ()=> Navigator.of(context).pop(),
        );
      });
  }

  
 //delete task
   void deleteTask(int index) {
        setState(() {
          db.toDoList.removeAt(index);
        });
         db.updateDatabase();
   }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:const Color(0xFFFFF5F6),
      appBar: AppBar(
        title: Text('My Tasks'),
        centerTitle: true,
        elevation:2 ,
        backgroundColor: const Color(0xFFFF7A8A),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask, 
        backgroundColor: const Color(0xFFFF7A8A),
        child: Icon(Icons.add, color: Colors.white),
        ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
            taskName: db.toDoList[index][0], 
            taskCompleted: db.toDoList[index][1], 
            onChanged: (value)=> checkBoxChanged(value, index),
            deleteFunction: (context)=> deleteTask(index),
          );
        }, 
       ),
    );  
  }
}
  