import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/todo_cards.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function(int) updateToCompletions;

  TodoList({required this.todos, required this.updateToCompletions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 570,
      child: ListView.builder(
        itemBuilder: (ctx, i) {
          return TodoCard(
            title: todos[i].title,
            completed: todos[i].completed,
            updateToCompletions: updateToCompletions,
            index: i,
          );
        },
        itemCount: todos.length,
      ),
    );
  }
}
