import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_notification/ImageFIle/image_file_controller.dart';

class ViewImagesUI extends StatefulWidget {
  const ViewImagesUI({Key? key}) : super(key: key);

  @override
  _ViewImagesUIState createState() => _ViewImagesUIState();
}

class _ViewImagesUIState extends State<ViewImagesUI> {

  late ImageFileController _imageFileController;


  @override
  void initState() {
    try{
      _imageFileController = Get.find();
    }catch(e){
      _imageFileController = Get.put(ImageFileController());
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('Image ' + _imageFileController.currentSelected.toString())),
      ),
      body: Center(
        child: GestureDetector(
          onPanEnd: (details){
            if(details.velocity.pixelsPerSecond.dx < 0){
              if(_imageFileController.currentSelected.value < _imageFileController.files.length){
                _imageFileController.currentSelected++;
              }
            }else if(details.velocity.pixelsPerSecond.dx > 0){
              if(_imageFileController.currentSelected.value > 1){
                _imageFileController.currentSelected--;
              }
            }
          },
          child: Obx(() => Image.asset(_imageFileController.files[_imageFileController.currentSelected.value].path!)),
          //TODO: complete it
          // child: Obx(() => TweenAnimationBuilder<>(tween: Tween(), duration: duration, builder: builder)),
        ),
      ),
    );
  }
}
