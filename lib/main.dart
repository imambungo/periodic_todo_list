import 'package:flutter/material.dart';
// import 'package:periodic_todo_list/screens/wrapper.dart';
// import 'package:periodic_todo_list/services/auth.dart';
// import 'package:periodic_todo_list/models/user.dart';
// import 'package:provider/provider.dart';
import 'pages/home.dart';
import 'pages/modify_task.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/': (context) => Home(),
    '/modify_task': (context) => ModifyTask(),
  }
));
