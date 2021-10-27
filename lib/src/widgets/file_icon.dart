import 'package:file_case/src/file_case_controller.dart';
import 'package:file_case/src/widgets/close_icon.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FileIcon extends StatelessWidget {
  const FileIcon(
      {this.platformFile,
      this.index,
      this.tag,
      this.fileIconColor,
      this.fileNameColor,
      Key? key})
      : super(key: key);
  final Color? fileIconColor, fileNameColor;
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
                Expanded(
                    flex: 4,
                    child: Icon(
                      _fileIcon(),
                      color: fileIconColor ?? Colors.black,
                    )),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.grey),
                    child: Text(
                      platformFile?.name ?? '',
                      style: TextStyle(
                          color: fileNameColor ?? Colors.white, fontSize: 11.0),
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

  IconData _fileIcon() {
    switch (platformFile!.extension) {
      case 'png':
      case 'jpg':
      case 'jpeg':
        return Icons.image;
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'docs':
      case 'txt':
      case 'docx':
        return Icons.file_copy;
      case 'mp4':
      case 'mov':
        return Icons.video_call;
      default:
        return Icons.file_copy;
    }
  }
}
