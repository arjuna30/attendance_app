import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  static void showLoadingDialog(BuildContext context) async => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const LoadingDialog(),
      );

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(title: Center(child: CircularProgressIndicator()));
  }
}
