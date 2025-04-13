import 'package:flutter/material.dart';

class ScoreContainer extends StatelessWidget {
  const ScoreContainer({
    super.key,
    required this.result,
    required this.textStyle,
  });
  final String result;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(result, style: textStyle);
  }
}
