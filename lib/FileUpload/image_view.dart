import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final PlatformFile file;
  const ImageView({Key? key, required this.file}) : super(key: key);

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image view"),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Image.file(File(widget.file.path!),),
        ),
      ),
    );
  }

}
