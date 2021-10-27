

A flutter widget to showcase and process uploaded files on Web, Android, Ios, MacOs, Linux & Windows.


# [Live Web Demo](https://asadamatic-pub-packages.web.app)
![example workflow](https://img.shields.io/github/workflow/status/asadamatic/file_case/pub_publish?label=Pub%20Build&logo=github
)
![example workflow](https://img.shields.io/github/workflow/status/asadamatic/file_case/Deploy%20to%20Firebase%20Hosting%20on%20merge?label=Web%20Example%20Build&logo=github
)

![example workflow](https://img.shields.io/github/last-commit/asadamatic/file_case?logo=github
) ![example workflow](https://img.shields.io/github/issues/asadamatic/file_case?logo=github&color=red
)
![example workflow](https://img.shields.io/github/issues-closed/asadamatic/file_case?logo=github
)


![example workflow](https://img.shields.io/github/stars/asadamatic/file_case?label=Stars&logo=github&style=social
)




## Features
<br>

* Show case files in a scrollable widget, selected using [file_picker](https://pub.dev/packages/file_picker)

* Access and process the selected files inside the flutter app  

### Web 
![Alt Text](./working_examples/web.gif)

### Desktop - MacOs & Windows 
![Alt Text](./working_examples/desktop.gif)

### Mobile - Android & Ios 
![Alt Text](./working_examples/mobile.gif)

### Upcoming Features  
<br>

* File preview 
* File name editing
* File sharing

## Getting started

Follow these simple steps to get started with `FileCase`, for detailed example see <a href="https://github.com/asadamatic/file_case/blob/master/example/lib/example.dart" class="special">example</a> folder. 

* Create an instance of `FileCaseController` and provide a unique string as `tag`  

```dart
final firstController = FileCaseController(
      filePickerOptions: FilePickerOptions(type: FileType.any),
      tag: 'controller1');
```
  
Pass `FilePickerOptions` to customize `pickFiles` functionality from `file_picker`.
For information about FilePickerOptions, hover over the parameters and see the docs.  

<br>

* Use the `FileCase` widget in your UI and pass the same `tag` string as for the `FileCaseController` 

```dart
const FileCase(
              tag: 'controller1',
            ),
```  

<br>

* Use the `FileUploadIconButton` or `FileUploadButton` in your UI to be able to pick files.  
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

            //For single file - Remove this comment for usage
            ..files.add(http.MultipartFile.fromBytes(
                'file', files.first.bytes as List<int>,
                filename: 'newupload.txt'))

            //For multiple files - Remove this comment for usage
            ..files.addAll(files.map((file) => http.MultipartFile.fromBytes(
                'file', file.bytes as List<int>,
                filename: file.name)))

      final finalResponse = await response.send();
  }
}
```  
> http.MultipartRequest does not return a response body.


## Additional information

Will be included in the future builds.

## Contributors

![GitHub Contributors Image](https://contrib.rocks/image?repo=asadamatic/file_case)
