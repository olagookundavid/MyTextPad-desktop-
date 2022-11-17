import 'package:desktop_app/dialog.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My TextPad'), actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.save),
            tooltip: 'Export to a File',
            onPressed: () {
              if (textController.text != '') {
                addNewDialog(context, textController.text);
              } else {
                final scaffolder = ScaffoldMessenger.of(context);
                const snackBar = SnackBar(
                  content: Text(
                    'Can\'t save an empty file.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  duration: Duration(seconds: 1),
                );
                scaffolder.showSnackBar(snackBar);
              }
            })
      ]),
      body: Center(
        child: TextField(
          controller: textController,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          expands: true,
          decoration: const InputDecoration(
              hintText: 'Write your private texts here...',
              contentPadding: EdgeInsets.all(12.0)),
        ),
      ),
    );
  }
}
