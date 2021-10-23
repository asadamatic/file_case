import 'package:file_case/src/file_picker_options.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class FileController extends GetxController {
  final files = <PlatformFile>[].obs;
  FilePickerOptions? filePickerOptions = FilePickerOptions();
  FileController({this.filePickerOptions});
  static FileController initialize(
      {String? tag, FilePickerOptions? filePickerOptions}) {
    return Get.put(FileController(filePickerOptions: filePickerOptions),
        tag: tag);
  }

  pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        dialogTitle: filePickerOptions?.dialogTitle ?? 'Desktop',
        onFileLoading: filePickerOptions?.onFileLoading ?? (_) {},
        allowedExtensions: filePickerOptions?.allowedExtensions ?? [],
        allowCompression: filePickerOptions?.allowCompression ?? true,
        withReadStream: filePickerOptions?.withReadStream ?? false,
        withData: filePickerOptions?.withData ?? false,
        type: filePickerOptions?.type ?? FileType.any,
        allowMultiple: filePickerOptions?.allowMultiple ?? false);

    if (result != null) {
      files.value = result.files.map((platformFile) => platformFile).toList();
      update();
    } else {
      // User canceled the picker
    }
  }

  removeAll() {
    files.value = [];
    update();
  }

  removeFile(index) {
    files.removeAt(index);
    update();
  }

  addFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        dialogTitle: filePickerOptions?.dialogTitle ?? '',
        onFileLoading: filePickerOptions?.onFileLoading ?? (_) {},
        allowedExtensions: filePickerOptions?.allowedExtensions ?? [],
        allowCompression: filePickerOptions?.allowCompression ?? true,
        withReadStream: filePickerOptions?.withReadStream ?? false,
        withData: filePickerOptions?.withData ?? false,
        type: filePickerOptions?.type ?? FileType.any,
        allowMultiple: filePickerOptions?.allowMultiple ?? false);

    if (result != null) {
      files.addAll(result.files.map((platformFile) => platformFile).toList());
      update();
    } else {
      // User canceled the picker
    }
  }
}

class FileCaseController {
  /// Unique identifier for [FileCaseController] , [FileCase] , [FileUploadIconButton] & [FileUploadButton] to make sure, that their instances are related correctly
  ///
  String? tag;
  FileController? _fileCaseController;
  FilePickerOptions? filePickerOptions;
  FileCaseController({this.tag, this.filePickerOptions}) {
    _fileCaseController = FileController.initialize(
        tag: tag, filePickerOptions: filePickerOptions);
  }

  List<PlatformFile> get files {
    return _fileCaseController!.files.value;
  }
}
