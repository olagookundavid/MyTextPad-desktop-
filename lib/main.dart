import 'dart:io';
import 'package:desktop_app/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    await Window.initialize();
    await Window.setEffect(
      effect: WindowEffect.aero,
      color: Colors.black.withOpacity(0.1),
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My TextPad',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white.withOpacity(.1),
          brightness: Brightness.dark,
        ),
        home: HomePage());
  }
}
