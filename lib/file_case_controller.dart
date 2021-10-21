import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class FileCaseController extends GetxController {
  final files = <PlatformFile>[].obs;

  FileCaseController initializeGET({String? tag}) {
    return Get.put(DummyController(), tag: tag);
  }

  pickFiles() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      files.value = result.files.map((platformFile) => platformFile).toList();
      update();
    } else {
      // User canceled the picker
    }
  }

  removeAll(){
    files.value = [];
    update();
  }
  removeFile(index) {
    files.removeAt(index);
    update();
  }

  addFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      files.addAll(result.files.map((platformFile) => platformFile).toList());
      update();
    } else {
      // User canceled the picker
    }
  }
}

class DummyController extends FileCaseController {


  pickFiles() async {
    FilePickerResult? result =
    await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      files.value = result.files.map((platformFile) => platformFile).toList();
      update();
    } else {
      // User canceled the picker
    }
  }


  addFile() async {
    FilePickerResult? result =
    await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      files.addAll(result.files.map((platformFile) => platformFile).toList());
      update();
    } else {
      // User canceled the picker
    }
  }
  removeFile(index) {
    files.removeAt(index);
    update();
  }
}