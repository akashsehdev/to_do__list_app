import 'package:flutter/material.dart';
import 'package:to_do_list_app/viewmodel/to_do_controller.dart';
import 'package:get/get.dart';

import '../widgets/text_widget.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  final ToDoController controller = Get.put(ToDoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const TextWidget(
          title: "ToDo List App",
          fSize: 25,
          fWeight: FontWeight.w500,
        )),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Title
              const TextWidget(
                title: "Add your task",
                fSize: 22,
                fWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Flexible(
                    //Text Field
                    child: TextField(
                      controller: controller.textController,
                      decoration: const InputDecoration(
                        labelText: "Add a new task",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),

                  //button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Set your desired radius here
                      ),
                    ),
                    onPressed: () {
                      if (controller.textController.text.isNotEmpty) {
                        controller.addTodoItem(controller.textController.text);
                        controller.textController.clear();
                        Get.snackbar("Task Added", "Task added successfully");
                      }
                    },
                    child: const TextWidget(
                      title: 'Add Task',
                      fSize: 15,
                      fWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),

              //List of items
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: controller.todoItems.length,
                    itemBuilder: (context, index) {
                      final item = controller.todoItems[index];
                      return ListTile(
                        title: Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 20,
                            decoration: item.isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        leading: Checkbox(
                          value: item.isCompleted,
                          onChanged: (bool? value) {
                            controller.toggleTaskCompletion(index);
                            Get.snackbar("Task Completed",
                                "Task completed successfully");
                          },
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ));
  }
}
