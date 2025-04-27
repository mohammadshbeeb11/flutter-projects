import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text, required this.function,
  });
  final String text;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blueGrey[700],
        padding: const EdgeInsets.symmetric(vertical: 12),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: function,
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}
