import 'package:design_task/screens/task_one.dart';
import 'package:design_task/screens/task_three.dart';
import 'package:design_task/screens/task_two.dart';
import 'package:flutter/material.dart';

class Listtasks extends StatefulWidget {
  const Listtasks({super.key});

  @override
  State<Listtasks> createState() => _ListtasksState();
}

class _ListtasksState extends State<Listtasks> {
  List<Widget> allTasks = [const TaskOne(), const TaskTwo(), const TaskThree()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All tasks"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: allTasks.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => allTasks[index]));
              },
              tileColor: Colors.white,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              title: Text("Task ${index + 1}"),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      ),
    );
  }
}
