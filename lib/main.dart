import 'package:first_proj/gradient.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          color: [
            Colors.orange,
            Colors.pink,
          ],
        ),
      ),
    ),
  );
}