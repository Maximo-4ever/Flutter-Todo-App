import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/counter.dart';
import 'package:todo_app/widgets/new_todo.dart';
import 'package:uuid/uuid.dart';
import 'package:todo_app/widgets/todo_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Todo> todos = [
    Todo(id: Uuid(), title: "Hacer que funcione", completed: true),
    Todo(id: Uuid(), title: "Terminar la app", completed: false),
    Todo(id: Uuid(), title: "Ver youtube", completed: false),
  ];

  void _updateTodoCompleted(int index) {
    setState(() {
      todos[index].completed = !todos[index].completed;
    });
  }

  void _showAddTodoModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bCtx) {
          return NewTodo(
            addTodo: _addTodo,
          );
        });
  }

  void _addTodo(String todo) {
    setState(() {
      todos.add(Todo(id: Uuid(), title: todo, completed: false));
    });
  }

  int _calcTotalCompletions() {
    var totalCompletions = 0;

    todos.forEach((todo) {
      if (todo.completed) {
        totalCompletions++;
      }
    });
    return totalCompletions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Counter(
              numberOfTodos: todos.length,
              totalCompletions: _calcTotalCompletions(),
            ),
            TodoList(todos: todos, updateToCompletions: _updateTodoCompleted),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTodoModal(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
