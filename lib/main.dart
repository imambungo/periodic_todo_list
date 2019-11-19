import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:periodic_todo_list/screens/wrapper.dart';
import 'package:periodic_todo_list/services/auth.dart';
import 'package:periodic_todo_list/models/user.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
=======
import 'pages/home.dart';
import 'pages/modify_task.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/': (context) => Home(),
    '/modify_task': (context) => ModifyTask(),
>>>>>>> firebase
  }
));
