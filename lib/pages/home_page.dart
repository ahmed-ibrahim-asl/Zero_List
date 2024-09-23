import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list_app/dataBase/database.dart';
import 'package:to_do_list_app/pages/Timer_page.dart';
import 'package:to_do_list_app/util/dialog_box.dart';
import 'package:to_do_list_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // reference the hive box 
  final _myBox = Hive.box('myBox');
  ToDoDatabase db = ToDoDatabase();
  
  




  @override
  void initState() {

    // if this is the 1st time openin the app (yes - set default data) (no - load old data)
    if(_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    
    } else {
      // there already existed 
      db.loadData();

    }

    super.initState();
  }

  // text controller
  final controller = TextEditingController();
  
  
  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState((){
      db.toDoList[index][1] = !db.toDoList[index][1]; 
    });

    db.updateDataBase();
  }

  // save the new task
  void saveNewTask() {
    setState((){

      if(controller.text != ''){
        db.toDoList.add([controller.text, false]);
        controller.clear();
      }

    });

    db.updateDataBase();
    Navigator.of(context).pop();
  }


  void createNewTask(){
    showDialog(
      context: context,
      builder: (context){
        return DialogBox(
          controller: controller,
          onSave: saveNewTask,

          //!
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }


  // delete task
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.all(0),
          
          child: Text(
            // we can make list and update that dynamically or something 
            // with motivation quotes or something
            "✓✓ Zero-List",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 33
              ),
            ),
        ),

          backgroundColor: Colors.black
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        foregroundColor: Colors.black,
        backgroundColor: Colors.yellow,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 25)
        ),





      body: ListView.builder(
        itemCount: db.toDoList.length,
        
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
            );
        },
            
        ),
          
      

      );
  }
}