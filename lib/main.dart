import 'package:flutter/material.dart';

import 'database/dabase_page/sqflite_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "sqlite database",
      debugShowCheckedModeBanner: false,
      home: SqflitePage(),
    );
  }
}

