import 'package:flutter/material.dart';
import 'package:note_app/utils/global_colors.dart';
import 'package:note_app/widgets/task_model2_widget.dart';
import 'package:note_app/widgets/task_widget.dart';
import 'task.screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Mnemonist"),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const AddTask(screenName: "Add Task");
                    },
                  ),
                );
              },
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
      body: Container(
        color: Colors.black,
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              TaskWidget2(
                                backgroundColor: GlobalColors.taskColor,
                                title: "Plan for today",
                              ),
                              TaskWidget2(
                                backgroundColor: GlobalColors.task2Color,
                                title: "Plan for tommorow",
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            children: const [
                              TaskWidget(),
                              TaskWidget(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
