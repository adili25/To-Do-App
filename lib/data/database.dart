import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {

  List toDoList = [];

  final _myBox = Hive.box('mybox');

  void createInitialData() {
    toDoList = [
      ['coding the project', false],
      ['study flutter course', false],
    ];
  }

  void loadData(){
    toDoList = _myBox.get('TODOLIST');
  }

  void UpdateDataBase(){
    _myBox.put("TODOLIST", toDoList);
  }
}