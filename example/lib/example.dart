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

  FileCaseController firstController =
      FileCaseController().initializeGET(tag: 'controller1');
  FileCaseController secondController =
      FileCaseController().initializeGET(tag: 'controller2');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        FileCase(
          fileCaseController: firstController,
          tag: 'controller1',
        ),
        FileUploadIconButton(
            fileCaseController: firstController, tag: 'controller1'),
        FileCase(fileCaseController: secondController, tag: 'controller2'),
        FileUploadIconButton(
            fileCaseController: secondController, tag: 'controller2'),
        TextButton(
            onPressed: () {
              print(firstController.files.length);
            },
            child: Text('Press me '))
      ],
    )));
  }
}
