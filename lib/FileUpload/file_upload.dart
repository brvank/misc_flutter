import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_notification/FileUpload/file_list.dart';

class FileUpload extends StatefulWidget {
  final bool isMulti;
  final List<String> allowedExtentions;
  const FileUpload({
    Key? key,
    required this.isMulti,
    required this.allowedExtentions,
  }) : super(key: key);

  @override
  _FileUploadState createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {
  FilePickerResult? result;
  var file = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File picker'),
      ),
      body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  pickFiles();
                },
                child: Text('Pick file'),
              ),
              if (result != null)
                InkWell(
                  onTap: () => loadSelectedFiles(result!.files),
                  child: Text("View Selected File", textDirection: TextDirection.ltr,
                      style: TextStyle(color: Colors.blue)),
                )
            ],
          )),
    );
  }

  void pickFiles() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: widget.isMulti,
      allowedExtensions: widget.allowedExtentions,
    );
    if (result == null) return;
    setState(() {});
  }

  // navigate user to 2nd screen to show selected files
  void loadSelectedFiles(files) {
    Get.to(FileList(files: files, onOpenedFile: viewFile));
  }

  // open the picked file
  void viewFile(file) {
    // OpenFile.open(file.path!);
    print('opening file');
  }
}