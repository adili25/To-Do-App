//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_2/data/database.dart';
//import 'package:todo_app_2/pages/login_page.dart';
import '../util/dialog_box.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //final FirebaseAuth instance = FirebaseAuth.instance;

  final _myBox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState(){
    if ( _myBox.get("TODOLIST") == null ){
      db.createInitialData();
    }
    else {
      db.loadData();
    }
    super.initState();
    // this code for signup and login

    // instance.authStateChanges().listen((User? user){
    //   if (user == null) {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => LoginPage()),
    //     );
    //   } else {
    //
    //   }
    // });
  }

  final _controller = TextEditingController();

  //List toDoList = [];

  void checkboxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.UpdateDataBase();
  }

  void sevaNewTask(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.UpdateDataBase();
  }

  void creatNewTask(){
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: sevaNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        }
    );
  }

  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.UpdateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: Center(child: Text(
            'TO DO',
            style: TextStyle(
              color: Colors.white,
            ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: creatNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[400],
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkboxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
