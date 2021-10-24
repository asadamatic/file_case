import 'package:file_case/src/file_case_controller.dart';
import 'package:file_case/src/widgets/close_icon.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FileIcon extends StatelessWidget {
  const FileIcon({this.platformFile, this.index, this.tag, Key? key})
      : super(key: key);

  final PlatformFile? platformFile;
  final int? index;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    FileController fileCaseController = Get.find<FileController>(tag: tag);
    return Container(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: const EdgeInsets.only(top: 14.0),
            child: Column(
              children: [
                Expanded(flex: 4, child: _fileIcon()),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey),
                    child: Text(
                      platformFile?.name ?? '',
                      style:
                          const TextStyle(color: Colors.white, fontSize: 11.0),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              right: 0.0,
              child: CloseIcon(onTap: () {
                fileCaseController.removeFile(index!);
              })),
        ],
      ),
    );
  }

  Icon _fileIcon() {
    switch (platformFile!.extension) {
      case 'png':
      case 'jpg':
      case 'jpeg':
        return const Icon(Icons.image);
      case 'pdf':
        return const Icon(Icons.picture_as_pdf);
      case 'docs':
      case 'txt':
      case 'docx':
        return const Icon(Icons.file_copy);
      case 'mp4':
      case 'mov':
        return const Icon(Icons.video_call);
      default:
        return const Icon(Icons.file_copy);
    }
  }
}
