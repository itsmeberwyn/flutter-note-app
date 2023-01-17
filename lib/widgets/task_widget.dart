import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note_app/utils/global_colors.dart';

class TaskWidget extends StatefulWidget {
  final String title;
  final String description;
  final bool isDone;

  const TaskWidget({
    super.key,
    required this.title,
    required this.description,
    required this.isDone,
  });

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  var isDone = false;

  @override
  void initState() {
    super.initState();
    isDone = widget.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Material(
        color: GlobalColors.classicTaskColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        child: ListTile(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          tileColor: const Color.fromARGB(28, 0, 0, 0),
          textColor: Colors.black,
          iconColor: Colors.white,
          title: Text(widget.title),
          leading: Checkbox(
            checkColor: Colors.white,
            value: isDone,
            onChanged: (bool? value) {
              setState(() {
                isDone = value!;
              });
            },
          ),
        ),
      ),
    );
  }
}
