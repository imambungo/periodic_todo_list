import 'package:flutter/material.dart';
import 'package:periodic_todo_list/screens/authentication/authentication.dart';
import 'package:periodic_todo_list/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:periodic_todo_list/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either Home or Authenticate widget
    if (user == null) {
      return Authentication();
    } else {
      return Home();
    }
  }
}
