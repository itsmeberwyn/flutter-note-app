import 'dart:developer';

import 'package:flutter/material.dart';

class TaskWidget2 extends StatefulWidget {
  final Color backgroundColor;
  final String title;

  const TaskWidget2(
      {super.key, required this.backgroundColor, required this.title});

  @override
  State<TaskWidget2> createState() => _TaskWidget2State();
}

class _TaskWidget2State extends State<TaskWidget2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      width: (MediaQuery.of(context).size.width / 2) - 10,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Material(
            color: widget.backgroundColor,
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
              textColor: Colors.white,
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
          Material(
            color: widget.backgroundColor,
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
              textColor: Colors.white,
              iconColor: Colors.white,
              title: const Text('Task 2'),
              leading: Radio(
                value: "Sample",
                groupValue: "",
                onChanged: (String? value) {
                  log(value.toString());
                  setState(() {});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
