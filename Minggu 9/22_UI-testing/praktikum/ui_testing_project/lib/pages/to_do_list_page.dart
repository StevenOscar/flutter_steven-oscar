import 'package:flutter/material.dart';
import '../widgets/drawer_widget.dart';

// Halaman baru yang belum pernah dibuat (Soal Prioritas 2 tugas UI Testing)
class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  List<String> tasksList = [];
  TextEditingController taskController = TextEditingController();

  void addTask() {
    setState(() {
      String newTask = taskController.text;
      if (newTask.isNotEmpty) {
        tasksList.add(newTask);
        taskController.clear();
      }
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasksList.removeAt(index);
    });
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('To Do List'),
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: taskController,
              decoration: const InputDecoration(
                hintText: 'Add task',
              ),
              onSubmitted: (_) {
                addTask();
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 50),
              child: ElevatedButton(
                onPressed: (){
                  addTask();
                },
                child: const Text("Submit")
              ),
            ),
            const Text(
              "To Do List",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: tasksList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasksList[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        deleteTask(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}