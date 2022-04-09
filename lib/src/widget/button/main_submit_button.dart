import 'package:attendance_app/src/const.dart';
import 'package:flutter/material.dart';

class MainSubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const MainSubmitButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: (onPressed != null)
            ? MaterialStateProperty.all<Color>(kMainColor)
            : MaterialStateProperty.all<Color>(Colors.grey),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
      child: Container(
          height: 58,
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white),
          )),
      onPressed: onPressed,
    );
  }
}
