import 'package:file_case/file_case_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FileIcon extends StatelessWidget {
  FileIcon({this.fileName, this.index, this.tag, Key? key}) : super(key: key);

  String? fileName;
  int? index;
  String? tag;

  @override
  Widget build(BuildContext context) {
    final fileCaseController = Get.find<FileCaseController>(tag: tag);
    return Container(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(8.0),
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
                  radius: 10.0,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.close,
                    color: Colors.red,
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
