import 'package:flutter/material.dart';
import '../task.dart';

class ModifyTask extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ModifyTaskState();
}

class _ModifyTaskState extends State<StatefulWidget> {
  Map arguments = {};
  Task task;

  TextEditingController taskController;
  //final periodController = TextEditingController();
  //final hariHController = TextEditingController();

  @override
  void dispose() {
    taskController.dispose();
    //periodController.dispose();
    //hariHController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context).settings.arguments;
    task = arguments['task'];

    taskController = TextEditingController(text: task.task);

    return Scaffold(
      //backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('Modify task'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Navigator.pop(context, {'delete': true});
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Text(
            'Task name: ${task.task}'
          ),
          TextFormField(
            //initialValue: task.task,
            controller: taskController,
          ),
          Text(
            'Period: ${task.periode}'
          ),
          Text(
            'Due: ${task.hariH}'
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          task.task = taskController.text;
          Navigator.pop(context, {'delete': false});
        },
        child: Icon(Icons.check),
        //backgroundColor: Colors.grey[400],
      ),
    );
  }
}
