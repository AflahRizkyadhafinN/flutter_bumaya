import 'package:file_picker/file_picker.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class LocalController {
  RxMap imagePick = {}.obs;
  RxString imageFrom = "db".obs;

  void pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["jpg", "png", "jpeg"],
    );

    if (result != null) {
      if (result.files.single.bytes == null) {
        imagePick["files"] = result.files.single.path;
        imagePick["device"] = "android";
      } else {
        var filesCode = result.files.single.bytes;
        imagePick["files"] = filesCode;
        imagePick["device"] = "web";
        imagePick["filename"] = result.files.single.name;
      }
      imageFrom.value = "local";
    }
  }
}
