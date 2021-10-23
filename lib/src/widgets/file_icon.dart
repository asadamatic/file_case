import 'package:file_case/src/file_case_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FileIcon extends StatelessWidget {
  const FileIcon({this.fileName, this.index, this.tag, Key? key})
      : super(key: key);

  final String? fileName;
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
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: const EdgeInsets.only(top: 14.0),
            child: Column(
              children: [
                const Icon(Icons.file_copy),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    fileName ?? '',
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.caption?.fontSize ??
                                12.0),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 0.0,
            child: InkWell(
              onTap: () {
                fileCaseController.removeFile(index!);
              },
              child: const Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  foregroundColor: Colors.red,
                  radius: 10.0,
                  backgroundColor: Color(0xffFF544E),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 10.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
