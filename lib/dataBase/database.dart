import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];


  final _myBox = Hive.box('myBox');


  // [[ firstTime || load data from dataBase || update the dataBase ]]
  void createInitialData(){
    toDoList = [
      ["Create your Tasks", false],
    ];
  }


  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  } 


  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
    
  } 

}