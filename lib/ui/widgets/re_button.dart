import 'package:flutter/material.dart';

class ReButton extends StatelessWidget {
  const ReButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
  });

  final VoidCallback onPressed;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    // return button
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width, height: 50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
