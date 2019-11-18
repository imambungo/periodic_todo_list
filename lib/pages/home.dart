import 'package:flutter/material.dart';
import '../task.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<StatefulWidget> {
  List<Task> tasks = [
    Task(task: 'jogging', hariH: -3, periode: 7),
    Task(task: 'main voli', hariH: 1, periode: 2),
    Task(task: 'belajar mobile app', hariH: 2, periode: 4),
  ];

  Widget _taskListBuilder() {
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
        // TODO
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: _taskListBuilder(),
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
