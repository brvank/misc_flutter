import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownController extends GetxController{


  var menuItems = <DropdownMenuItem<String>>[].obs;
  var dropdownValue = ''.obs;

  void prepareItemsList(List<String> items){
    for(int i=0;i<items.length;i++){
      if(dropdownValue.value == ''){
        dropdownValue.value = items[0];
      }
      menuItems.add(DropdownMenuItem(
        value: items[i],
        child: Text(items[i]),
      ));
    }
  }

}