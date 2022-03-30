import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_notification/ImageFIle/image_file_controller.dart';
import 'package:push_notification/ImageFIle/view_images_ui.dart';

class ImageFileUI extends StatefulWidget {
  const ImageFileUI({Key? key}) : super(key: key);

  @override
  _ImageFileUIState createState() => _ImageFileUIState();
}

class _ImageFileUIState extends State<ImageFileUI> {
  late ImageFileController _imageFileController;

  @override
  void initState() {
    try {
      _imageFileController = Get.find();
    } catch (e) {
      _imageFileController = Get.put(ImageFileController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => _imageFileController.files.length == 0?Text('Images'):Text('Images(' + _imageFileController.files.length.toString() + ')')),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
              onTap: (){
                _imageFileController.files.clear();
              },
              child: const Icon(Icons.clear_all),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
              onTap: selectFiles,
              child: const Icon(Icons.find_in_page),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        child: Obx(() => GridView.builder(
          itemCount: _imageFileController.files.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              color: Colors.black,
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: (){
                  _imageFileController.currentSelected.value = index+1;
                  Get.to(ViewImagesUI());
                },
                child: SizedBox(
                  width: Get.width/2,
                  child: Image.file(File(_imageFileController.files[index].path!)),
                ),
              ),
            );
            })),
      ),
    );
  }

  Future<void> selectFiles() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg'],
        allowMultiple: true);

    if (result != null) {
      for(int i=0;i<result.files.length;i++){
        _imageFileController.files.add(result.files[i]);
      }
    } else {
      // User canceled the picker
      log('No files selected');
    }
  }
}
