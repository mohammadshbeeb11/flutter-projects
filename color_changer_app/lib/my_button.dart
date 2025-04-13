import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String name;
  const MyButton({super.key, required this.onPressed, required this.name});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        side: BorderSide(
          color: Colors.white
        ),
        foregroundColor: Colors.white
      ),
      onPressed: widget.onPressed,
      child: Text(widget.name),
    );
  }
}
