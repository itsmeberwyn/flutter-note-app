import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  final String screenName;

  const AddTask({super.key, required this.screenName});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  late FocusNode focusNode = FocusNode();
  var isDescriptionInputFocus = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
    focusNode.removeListener(_onFocusChange);
  }

  void _onFocusChange() {
    // debugPrint("Focus: ${focusNode.hasFocus.toString()}");
    if (focusNode.hasFocus) {
      isDescriptionInputFocus = true;
    } else {
      isDescriptionInputFocus = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.screenName),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.black,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Task title",
                  labelStyle: MaterialStateTextStyle.resolveWith(
                    (states) {
                      Color color = states.contains(MaterialState.focused)
                          ? Colors.blue
                          : Colors.white38;
                      return TextStyle(color: color);
                    },
                  ),
                  border: const OutlineInputBorder(),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white38),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                focusNode: focusNode,
                style: const TextStyle(
                  color: Colors.white,
                ),
                keyboardType: TextInputType.multiline,
                minLines: 2,
                maxLines: 4,
                decoration: isDescriptionInputFocus
                    ? InputDecoration(
                        labelText: "Task description",
                        labelStyle: MaterialStateTextStyle.resolveWith(
                          (states) {
                            Color color = states.contains(MaterialState.focused)
                                ? Colors.blue
                                : Colors.white38;
                            return TextStyle(color: color);
                          },
                        ),
                        border: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white38),
                        ),
                      )
                    : InputDecoration(
                        hintText: "Task description",
                        hintStyle: MaterialStateTextStyle.resolveWith(
                          (states) {
                            Color color = states.contains(MaterialState.focused)
                                ? Colors.blue
                                : Colors.white38;
                            return TextStyle(color: color);
                          },
                        ),
                        border: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white38),
                        ),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.maxFinite,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    widget.screenName == "Add Task" ? "Add" : "Update",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
