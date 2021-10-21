library file_case;

import 'package:file_case/file_case_controller.dart';
import 'package:file_case/src/widgets/file_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FileCase extends StatelessWidget {
  const FileCase({Key? key, this.tag}) : super(key: key);
  final String? tag;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FileCaseController>(
        tag: tag,
        builder: (_controller) {
          if (_controller.files.isEmpty) {
            return const Padding(padding: EdgeInsets.all(24.0));
          }
          return Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            margin: const EdgeInsets.all(12.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _controller.files.length + 1,
              itemBuilder: (_, index) => index == _controller.files.length
                  ? IconButton(
                      onPressed: _controller.addFile,
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                    )
                  : FileIcon(
                      fileName: _controller.files[index].name,
                      index: index,
                      tag: tag,
                    ),
            ),
          );
        });
  }
}

class FileUploadIconButton extends StatelessWidget {
  const FileUploadIconButton({Key? key, this.tag}) : super(key: key);
  final String? tag;

  @override
  Widget build(BuildContext context) {
    final _fileCaseController = Get.find<FileCaseController>(tag: tag);
    return IconButton(
      onPressed: () {
        _fileCaseController.pickFiles();
      },
      icon: const Icon(Icons.upload_file),
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
    );
  }
}

class FileUploadButton extends StatelessWidget {
  const FileUploadButton({Key? key, this.tag}) : super(key: key);

  final String? tag;
  @override
  Widget build(BuildContext context) {
    final _fileCaseController = Get.find<FileCaseController>(tag: tag);
    return TextButton.icon(
      onPressed: () {
        _fileCaseController.pickFiles();
      },
      icon: const Icon(Icons.upload_file),
      label: const Text('Select Files'),
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).primaryColor)),
    );
  }
}
