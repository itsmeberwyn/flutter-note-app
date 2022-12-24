import 'package:flutter/material.dart';

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
        title: const Text("Mnemonist"),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 238, 122, 84),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Plan for today",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Material(
                          color: const Color.fromARGB(255, 238, 122, 84),
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
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                        Material(
                          color: const Color.fromARGB(255, 238, 122, 84),
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
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    height: 200,
                    child: const Text(
                      "Sample 1",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
