import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_notification/FileUpload/image_view.dart';

class FileList extends StatefulWidget {
  final List files;
  final ValueChanged onOpenedFile;

  const FileList({Key? key, required this.files, required this.onOpenedFile})
      : super(key: key);

  @override
  _FileListState createState() => _FileListState();
}

class _FileListState extends State<FileList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Selected Files'),
      ),
      body: ListView.builder(
          itemCount: widget.files.length,
          itemBuilder: (context, index) {
            PlatformFile file = widget.files[index];
            if(file.bytes == null){
              print('here it is');
              return InkWell(
                onTap: (){
                  Get.to(ImageView(file: file));
                },
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.file(File(file.path!)),
                ),
              );
            }else{
              print(file.bytes.toString().substring(0,20));
              print('also to string');
              print(file.path.toString());
              return SizedBox(
                height: 100,
                width: 100,
                child: Image.memory(file.bytes!),
              );
            }
          }),
    );
  }
}
