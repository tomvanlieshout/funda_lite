import 'package:flutter/material.dart';

class ButtonBar extends StatelessWidget {
  final List<IconButton> buttons;

  const ButtonBar(this.buttons, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [...buttons]);
  }
}
