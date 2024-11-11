import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app/model/to_do_model.dart';

class ToDoController extends GetxController{
  //Empty list
  var todoItems = <ToDoItem>[].obs;
  final TextEditingController textController = TextEditingController();


  void addTodoItem(String title) {
    todoItems.add(ToDoItem(title: title));
  }

  void toggleTaskCompletion(int index) {
    var item = todoItems[index];
    item.isCompleted = !item.isCompleted;
    // Update the observable list
    todoItems[index] = item;  
  }
}
