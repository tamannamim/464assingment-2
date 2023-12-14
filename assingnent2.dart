import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class TodoItem {
  String task;
  bool isDone;

  TodoItem({required this.task, this.isDone = false});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<TodoItem> todoItems = [
    TodoItem(task: 'Task 1'),
    TodoItem(task: 'Task 2'),
    TodoItem(task: 'Task 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: todoItems.length,
        itemBuilder: (context, index) {
          return TodoListItem(
            todoItem: todoItems[index],
            onCheckboxChanged: (value) {
              setState(() {
                todoItems[index].isDone = value;
              });
            },
          );
        },
      ),
    );
  }
}

class TodoListItem extends StatelessWidget {
  final TodoItem todoItem;
  final ValueChanged<bool> onCheckboxChanged;

  TodoListItem({required this.todoItem, required this.onCheckboxChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todoItem.task,
        style: todoItem.isDone
            ? TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              )
            : null,
      ),
      leading: Checkbox(
        value: todoItem.isDone,
        onChanged: onCheckboxChanged,
      ),
    );
  }
}
