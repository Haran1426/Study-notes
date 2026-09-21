import 'package:flutter/material.dart';
import 'notepad/notepad_view.dart';

void main() {
  runApp(const NotepadApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notepad',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const NotepadApp (title: 'Notepad Page'),
    );
  }
}