import 'dart:io';
import 'package:desktop_app/custom_button.dart';
import 'package:flutter/material.dart';

TextEditingController fileName = TextEditingController();

addNewDialog(context, String text) {
  Future<void> _exportToFile(String text) async {
    final scaffolder = ScaffoldMessenger.of(context);
    final File file =
        File('${Directory.current.absolute.path}/${fileName.text}.txt');
    final snackBar = SnackBar(
      content: Text(
        'Saved to: ${file.path}',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      duration: const Duration(seconds: 1),
    );

    await file.writeAsString(text);
    scaffolder.showSnackBar(snackBar);
  }

  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        final navigator = Navigator.of(context);
        return AlertDialog(
          contentPadding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
          scrollable: true,
          title: const Text('File Name'),
          content: SizedBox(
            child: controller(fileName,
                hintText: 'File Name',
                suffix: const Text(
                  '.txt',
                  style: TextStyle(color: Colors.grey),
                )),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  width: 80,
                  ontap: () async {
                    if (fileName.text != '') {
                      await _exportToFile(text);
                      fileName.clear();
                      navigator.pop();
                    }
                  },
                  text: 'Save',
                ),
                CustomButton(
                  width: 80,
                  ontap: () {
                    fileName.clear();
                    Navigator.pop(context);
                  },
                  text: 'Back',
                ),
              ],
            ),
          ],
        );
      });
}

//a resuable function that returns a textfield
TextField controller(TextEditingController controller,
    {String? hintText, Widget? suffix}) {
  return TextField(
    controller: controller,
    decoration:
        InputDecoration(suffixIcon: suffix, filled: true, hintText: hintText),
  );
}
