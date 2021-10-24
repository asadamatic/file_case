import 'package:file_case/file_case.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Case Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final FileCaseController firstController = FileCaseController(
      filePickerOptions:
          FilePickerOptions(type: FileType.any, allowMultiple: true),
      tag: 'controller1');
  final FileCaseController secondController = FileCaseController(
      tag: 'controller2',
      filePickerOptions: FilePickerOptions(allowMultiple: true));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('File Case Example'),),
        body: Center(
            child: Column(
          children: const [
            const FileCase(
              tag: 'controller1',
            ),
            const FileUploadIconButton(tag: 'controller1'),
            const FileCase(tag: 'controller2'),
            const FileUploadIconButton(tag: 'controller2'),
          ],
        )));
  }
}
