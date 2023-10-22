import 'package:flutter/material.dart';

class InputValue extends StatelessWidget {
  const InputValue({
    super.key,
    required this.onSubmitted,
    required this.label,
  });

  final Function(String value) onSubmitted;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onSubmitted,
      decoration: InputDecoration(labelText: label),
    );
  }
}
