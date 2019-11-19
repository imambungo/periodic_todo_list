import 'package:flutter/material.dart';
import '../task.dart';
import 'package:numberpicker/numberpicker.dart';

class ModifyTask extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ModifyTaskState();
}

class _ModifyTaskState extends State<StatefulWidget> {
  Map arguments = {};
  Task task;

  TextEditingController taskController;
  int period;

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context).settings.arguments;
    task = arguments['task'];

    taskController = TextEditingController(text: task.task);
    period = task.periode;

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
            controller: taskController,
          ),
          Text(
            'Period: ${task.periode}'
          ),
          NumberPicker.integer(
            initialValue: task.periode,
            minValue: 1,
            maxValue: 30,
            onChanged: (newValue) {
              period = newValue;
            },
          ),
          Text(
            'Due: ${task.hariH}'
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          task.task = taskController.text;
          task.periode = period;
          if (task.hariH < -task.periode)
            task.hariH = -task.periode;

          Navigator.pop(context, {'delete': false, 'modify': true});
        },
        //backgroundColor: Colors.grey[400],
      ),
    );
  }
}
