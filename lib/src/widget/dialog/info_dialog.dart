import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  final String text;
  const InfoDialog({Key? key, required this.text}) : super(key: key);

  static void showInfoDialog(BuildContext context, String text) => showDialog(
        context: context,
        builder: (context) => InfoDialog(text: text),
      );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(title: Text(text, textAlign: TextAlign.center));
  }
}
