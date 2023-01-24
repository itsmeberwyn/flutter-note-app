import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/dataController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/task_widget.dart';
import 'task.screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DataController dataController = Get.put(DataController());

  RxBool isLoading = Get.find<DataController>().isLoading;
  List<dynamic> taskData = [];

  loadData() async {
    final prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('user_id') ?? 0;
    await Get.find<DataController>().getData('users/$userId/tasks').then(
      (value) {
        taskData = Get.find<DataController>().myData;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    loadData();

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
        decoration: const BoxDecoration(color: Colors.black),
        child: Obx(
          () => !isLoading.value
              ? ListView.builder(
                  itemCount: taskData.length,
                  itemBuilder: (context, index) {
                    return TaskWidget(
                      title: taskData[index]['title'],
                      description: taskData[index]['description'],
                      isDone: taskData[index]['is_done'],
                    );
                  },
                )
              : Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.black),
                  child: const Text("Loading"),
                ),
        ),
      ),
    );
  }
}

// TaskWidget(),
