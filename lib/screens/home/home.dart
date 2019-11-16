import 'package:flutter/material.dart';
import 'package:periodic_todo_list/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('To-do List'),
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add task'),
            onPressed: () async {
              await _auth.singOut();
            },
          )
        ],
      ),
    );
  }
}
