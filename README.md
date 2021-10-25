

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

A flutter widget to showcase and process uploaded files on Web, Android, Ios, MacOs, Linux & Windows.


![example workflow](https://img.shields.io/github/workflow/status/asadamatic/file_case/pub_publish?label=actions&logo=github
)  ![example workflow](https://img.shields.io/github/last-commit/asadamatic/file_case?logo=github
) ![example workflow](https://img.shields.io/github/issues/asadamatic/file_case?logo=github&color=red
)
![example workflow](https://img.shields.io/github/issues-closed/asadamatic/file_case?logo=github
)


![example workflow](https://img.shields.io/github/stars/asadamatic/file_case?label=Stars&logo=github&style=social
)




## Features
#

* Show case files in a scrollable widget, selected using [file_picker](https://pub.dev/packages/file_picker)

* Access and process the selected files inside the flutter app  

### Web 
![Alt Text](./working_examples/web.gif)

### Desktop - MacOs & Windows 
![Alt Text](./working_examples/desktop.gif)

### Mobile - Android & Ios 
![Alt Text](./working_examples/mobile.gif)

### Upcoming Features
#

* File preview 
* File name editing
* File sharing

## Getting started

Follow these simple steps to get started with `FileCase`, for detailed example see <a href="https://github.com/asadamatic/file_case/blob/master/example/lib/example.dart" class="special">example</a> folder. 

1. Create an instance of `FileCaseController` and provide a unique string as `tag`

```dart
final FileCaseController firstController = FileCaseController(
      filePickerOptions: FilePickerOptions(type: FileType.any),
      tag: 'controller1');
```

Pass `FilePickerOptions` to customize `pickFiles` functionality from `file_picker`.
For information about FilePickerOptions, hover over the parameters and see the docs.

2. Use the `FileCase` widget in your UI and pass the same `tag` string as for the `FileCaseController` 

```dart
const FileCase(
              tag: 'controller1',
            ),
```

3. Use the `FileUploadIconButton` or `FileUploadButton` in your UI to be able to pick files.
Pass the same `tag` string as for the corresponding `FileCaseController` and `FileCase`.

```dart
const FileUploadIconButton(tag: 'controller1'),

OR

const FileUploadButton(tag: 'controller1'),
```


## Usage

### Sending files over an API 

* Using FormData  
<br> 
FormData is available in [Dio](https://pub.dev/packages/dio)

```dart

import 'package:dio/dio.dart' as dio;

class NetworkService {
  final url = 'http://127.0.0.1:8000/files'; // local host url

  uploadFiles(List<PlatformFile> platformFiles) async {
    final formData = dio.FormData();

    formData.files.addAll(platformFiles.map((platformFile) => MapEntry(
        'files',
        dio.MultipartFile.fromBytes(platformFile.bytes as List<int>,
            filename: platformFile.name))));
    final response = await dio.Dio().post(url, data: formData);

    print(response.statusCode);
  }
}
```
* Using MultipartRquest  
<br> 
MultipartRequest is available in [http](https://pub.dev/packages/http)

```dart
import 'package:http/http.dart' as http;

class NetworkService {
  final url = 'http://127.0.0.1:8000/files'; // local host url

  uploadFiles(List<PlatformFile> platformFiles) async {
    final response =
          http.MultipartRequest('POST', Uri.parse(url + '/fileupload'))
            //For single file
            ..files.add(http.MultipartFile.fromBytes(
                'file', files.first.bytes as List<int>,
                filename: 'newupload.txt'))
            //For multiple files
            ..files.addAll(files.map((file) => http.MultipartFile.fromBytes(
                'file', file.bytes as List<int>,
                filename: file.name)))

      final finalResponse = await response.send();
      print(finalResponse.statusCode);
  }
}
```



## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.

## Contributors

![GitHub Contributors Image](https://contrib.rocks/image?repo=asadamatic/file_case)
