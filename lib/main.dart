import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:imagegallery/views/home.dart';
import "dart:ui";

Future<void> main() async  {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Gallery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary:  Colors.white,
          secondary: Colors.white,
          ),
      ),
      home:  Home(),
    );
  }
}
