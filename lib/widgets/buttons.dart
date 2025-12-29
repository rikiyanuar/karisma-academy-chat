import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.purple),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
      ),
      child: Text(label),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final IconData? icon;

  const SecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.red),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
      ),
      label: Text(label),
      icon: icon == null
          ? null
          : Icon(
              icon,
              color: Colors.white,
            ),
    );
  }
}
