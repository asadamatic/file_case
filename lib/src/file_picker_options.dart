
import 'package:file_picker/file_picker.dart';

class FilePickerOptions {
  /// `dialogTitle` can be optionally set on desktop platforms to set the modal window title. It will be ignored on
  /// other platforms.
  ///
  String? dialogTitle = '';

  /// Default `type` set to [FileType.any] with `allowMultiple` set to `false`.
  ///
  FileType type = FileType.any;

  /// Optionally, `allowedExtensions` might be provided (e.g. `[pdf, svg, jpg]`.).
  ///
  /// Custom extension filters are only allowed with `FileType.custom`, please change it or remove filters.
  List<String>? allowedExtensions;

  /// If you want to track picking status, for example, because some files may take some time to be
  /// cached (particularly those picked from cloud providers), you may want to set [onFileLoading] handler
  /// that will give you the current status of picking.
  ///
  dynamic Function(FilePickerStatus)? onFileLoading;

  /// If `allowCompression` is set, it will allow media to apply the default OS compression.
  /// Defaults to `true`.
  ///
  bool allowCompression = true;

  bool allowMultiple = false;

  /// If `withData` is set, picked files will have its byte data immediately available on memory as `Uint8List`
  /// which can be useful if you are picking it for server upload or similar. However, have in mind that
  /// enabling this on IO (iOS & Android) may result in out of memory issues if you allow multiple picks or
  /// pick huge files. Use `withReadStream` instead. Defaults to `true` on web, `false` otherwise.
  ///
  bool withData = false;

  /// If `withReadStream` is set, picked files will have its byte data available as a `Stream<List<int>>`
  /// which can be useful for uploading and processing large files. Defaults to `false`.
  ///
  bool withReadStream = false;

  /// Options for file picker functionality
  /// Hover over parameters to see docs
  FilePickerOptions({
    this.dialogTitle,
    this.type = FileType.any,
    this.allowedExtensions,
    this.onFileLoading,
    this.allowCompression = true,
    this.allowMultiple = false,
    this.withData = false,
    this.withReadStream = false,
  }): assert(allowedExtensions == null || type == FileType.custom,
  'Custom extension filters are only allowed with `FileType.custom`, please change it or remove filters.\n');

  // FileType get type {
  //   return _getFileType();
  // }

  // FileType _getFileType() {
  //   switch (caseFileType) {
  //     case CaseFileType.any:
  //       return FileType.any;
  //
  //     case CaseFileType.custom:
  //       return FileType.any;
  //
  //     case CaseFileType.media:
  //       return FileType.any;
  //
  //     case CaseFileType.video:
  //       return FileType.any;
  //     case CaseFileType.image:
  //       return FileType.any;
  //     default:
  //       return FileType.any;
  //   }
  // }
}
//
// enum CaseFileType {
//   custom,
//   any,
//   image,
//   audio,
//   media,
//   video,
// }
