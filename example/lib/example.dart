import 'package:file_case/file_case.dart';
import 'package:flutter/material.dart';

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
        appBar: AppBar(
          title: const Text('File Case Example'),
        ),
        body: Center(
            child: Column(
          children: const [
            FileCase(
              tag: 'controller1',
            ),
            FileUploadIconButton(tag: 'controller1'),
            FileCase(tag: 'controller2'),
            FileUploadIconButton(tag: 'controller2'),
          ],
        )));
  }
}
