import 'package:flutter/material.dart';

class ModifyTask extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ModifyTaskState();
}

class _ModifyTaskState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('#nama task'),
      ),
    );
  }
}
