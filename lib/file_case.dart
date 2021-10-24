library file_case;

import 'package:file_case/src/file_case_controller.dart';
import 'package:file_case/src/widgets/file_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
export 'package:file_case/src/widgets/file_icon.dart' hide FileIcon;
export 'package:file_case/src/file_picker_options.dart' show FilePickerOptions;
export 'package:file_case/src/file_case_controller.dart'
    show FileCaseController;
export 'package:file_picker/file_picker.dart' show FileType, FilePickerStatus;

class FileCase extends StatelessWidget {
  /// [FileCase] widget displays selected files in a container
  /// On Rendering [FileCase] widget searches for [FileController] with the provided [tag], which is initialized when an instance of [FileCaseController] is created with corresponding [tag]
  ///
  const FileCase(
      {Key? key,
      this.tag,
      this.backgroundColor,
      this.shadowColor,
      this.addButtonBackgroundColor,
      this.addButtonIconColor})
      : super(key: key);

  /// Unique identifier for [FileCaseController] , [FileCase] , [FileUploadIconButton] & [FileUploadButton] to make sure, that their instances are related correctly
  ///
  final String? tag;

  /// Background color for [FileCase] widget
  ///
  final Color? backgroundColor;

  /// Color for [FileCase] shadow
  ///
  final Color? shadowColor;

  /// Background color for add button
  ///
  final Color? addButtonBackgroundColor;

  /// Color for add button icon
  ///
  final Color? addButtonIconColor;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FileController>(
        tag: tag,
        builder: (_controller) {
          if (_controller.files.isEmpty) {
            return const Padding(padding: EdgeInsets.all(24.0));
          }
          return Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: shadowColor?.withOpacity(0.4) ??
                      Colors.grey.withOpacity(0.4),
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
                  ? _controller.filePickerOptions!.allowMultiple
                      ? CircleAvatar(
                          backgroundColor: addButtonBackgroundColor,
                          radius: 15.0,
                          child: IconButton(
                            onPressed: _controller.addFile,
                            icon: const Icon(
                              Icons.add,
                            ),
                            color: addButtonIconColor,
                            iconSize: 15.0,
                          ),
                        )
                      : const SizedBox()
                  : FileIcon(
                      platformFile: _controller.files[index],
                      index: index,
                      tag: tag,
                    ),
            ),
          );
        });
  }
}

class FileUploadIconButton extends StatelessWidget {
  /// Displays an [IconButton] that picks files, to be displayed in the corresponding [FileCase] widget
  ///
  const FileUploadIconButton({Key? key, this.tag}) : super(key: key);

  /// Unique identifier for [FileCaseController] , [FileCase] , [FileUploadIconButton] & [FileUploadButton] to make sure, that their instances are related correctly
  ///
  final String? tag;

  @override
  Widget build(BuildContext context) {
    FileController fileCaseController = Get.find<FileController>(tag: tag);
    return IconButton(
      onPressed: () {
        fileCaseController.pickFiles();
      },
      icon: const Icon(Icons.upload_file),
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
    );
  }
}

class FileUploadButton extends StatelessWidget {
  /// Displays a [TextButton] that picks files, to be displayed in the corresponding [FileCase] widget
  ///
  const FileUploadButton({Key? key, this.tag}) : super(key: key);

  /// Unique identifier for [FileCaseController] , [FileCase] , [FileUploadIconButton] & [FileUploadButton] to make sure, that their instances are related correctly
  ///
  final String? tag;
  @override
  Widget build(BuildContext context) {
    FileController fileCaseController = Get.find<FileController>(tag: tag);
    return TextButton.icon(
      onPressed: () {
        fileCaseController.pickFiles();
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
