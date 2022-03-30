import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class ImageFileController extends GetxController{

  var files = <PlatformFile>[].obs;

  var currentSelected = 1.obs;

}