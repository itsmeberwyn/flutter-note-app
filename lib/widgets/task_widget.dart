import 'package:flutter/material.dart';
import 'package:note_app/utils/global_colors.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
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
          title: const Text('Task 1'),
          leading: Radio(
            value: "Sample",
            groupValue: "",
            onChanged: (String? value) {
              print(value);
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
