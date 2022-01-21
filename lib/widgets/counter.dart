import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int numberOfTodos;
  final int totalCompletions;
  Counter({required this.numberOfTodos, required this.totalCompletions});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 55, 0, 40),
      child: Text(
        "$totalCompletions/$numberOfTodos",
        style: TextStyle(
            fontSize: 44,
            color: totalCompletions == numberOfTodos
                ? Colors.green
                : Colors.black),
      ),
    );
  }
}
