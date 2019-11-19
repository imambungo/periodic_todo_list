import 'package:flutter/material.dart';
import '../task.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<StatefulWidget> {
  List<Task> tasks = [
    Task(task: 'belajar mobile app', hariH: 2, periode: 4),
    Task(task: 'jogging', hariH: -3, periode: 7),
    Task(task: 'main voli', hariH: 1, periode: 2),
  ];

  Widget _taskListBuilder() {
    tasks.sort(
      (a, b) {
        if (a.hariH == b.hariH)
          return b.periode.compareTo(a.periode);
        return a.hariH.compareTo(b.hariH);
      }
    );

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: tasks.length,
      separatorBuilder: (BuildContext context, int index) => Divider(height: 1),
      itemBuilder: (context, index) {
        return _taskBuilder(tasks[index]);
      },
    );
  }

  Widget _taskBuilder(Task task) {
    return ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '${task.hariH}',
          ),
          Icon(
            Icons.today,
          ),
        ],
      ),
      title: Text(
        task.task,
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.check,
          color: task.hariH > 1 ? Colors.green : Colors.grey,
        ),
        onPressed: () {
          setState(() {
            task.hariH = task.periode;
          });
        },
      ),
      onTap: () {
        _modifyTask(task);
      }
    );
  }

  dynamic _modifyTask(Task task) async {
    dynamic data = await Navigator.pushNamed(
                     context,
                     '/modify_task',
                     arguments: { 'task' : task },
                   );

    if (data['delete'])
      tasks.remove(task);

    return data;
  }

  void _addNewTask() async {
    Task newTask = Task(task: 'Task name', periode: 7, hariH: 7);
    dynamic data = await _modifyTask(newTask);

    if (data['modify'])
      tasks.add(newTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text('TODO: ${tasks.length}'),
            Expanded( // https://stackoverflow.com/a/49506624/9157799
              child: _taskListBuilder(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewTask();
        },
        child: Icon(Icons.add),
        //backgroundColor: Colors.grey[400],
      ),
    );
  }
}
