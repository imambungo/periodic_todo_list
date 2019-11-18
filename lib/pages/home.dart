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
      (a, b) => a.hariH.compareTo(b.hariH)
    );

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return _taskBuilder(tasks[index]);
      },
    );
  }

  Widget _taskBuilder(Task task) {
    return ListTile(
      title: Text(
        task.task,
      ),
      leading: Text(
        '${task.periode}',
      ),
      trailing: Text(
        '${task.hariH}',
      ),
      onTap: () {
        _modifyTask(task);
      }
    );
  }

  void _modifyTask(Task task) async {
    dynamic data = await Navigator.pushNamed(
                     context,
                     '/modify_task',
                     arguments: { 'task' : task },
                   );

    if (data['delete'])
      tasks.remove(task);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
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
          // TODO
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[400],
      ),
    );
  }
}
