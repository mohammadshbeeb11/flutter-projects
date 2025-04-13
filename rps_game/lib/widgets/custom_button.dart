import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({super.key, this.onPressed, required this.icon});
  final void Function()? onPressed;
  final String icon;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      child: Text(widget.icon),
    );
  }
}
