import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    required this.text,
    required this.onClicked,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialButton(
        onPressed: onClicked,
        color: Theme.of(context).primaryColor,
        textColor: Colors.black,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      );
}
