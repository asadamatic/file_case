import 'package:file_case/file_case.dart';
import 'package:file_case/file_case_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final _firstController = FileCaseController();
  final _secondController = FileCaseController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: const [
        FileCase(
          tag: 'controller1',
        ),
        FileUploadIconButton(tag: 'controller1'),
        FileCase(tag: 'controller2'),
        FileUploadIconButton(tag: 'controller2')
      ],
    )));
  }
}
