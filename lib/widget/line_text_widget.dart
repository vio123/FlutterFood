import 'package:flutter/material.dart';

class LineTextWidget extends StatelessWidget {
  const LineTextWidget({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}