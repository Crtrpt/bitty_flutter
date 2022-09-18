import 'dart:io';

import 'package:bitty/api/api.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickFile extends StatefulWidget {
  PickFile({this.onUploadSuccess, this.onSelectLocalFile});
  Function? onUploadSuccess;
  Function? onSelectLocalFile;
  @override
  State<PickFile> createState() => PickFileState(
      onUploadSuccess: this.onUploadSuccess,
      onSelectLocalFile: this.onSelectLocalFile);
}

class PickFileState extends State<PickFile> {
  PickFileState({this.onUploadSuccess, this.onSelectLocalFile});
  Function? onUploadSuccess;
  Function? onSelectLocalFile;
  File? localFile;
  pick() async {
    print("选择文件");
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'gif', "jpeg"]);

    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        localFile = file;
      });
      onSelectLocalFile?.call(file);
      Api.upload("asset/uploadImage", file)
          .then((res) => {print("上传回调"), onUploadSuccess?.call(res)});
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(Object context) {
    return GestureDetector(
      onTap: () => pick(),
      child: (localFile != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(80 / 2),
              child: Image.file(
                localFile!,
                width: 80,
                height: 80,
              ))
          : Text(
              "选择文件",
              style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            )),
    );
  }
}
