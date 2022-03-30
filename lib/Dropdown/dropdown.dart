import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_notification/Dropdown/dropdown_controller.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({Key? key}) : super(key: key);

  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  late DropdownController _dropdownController = DropdownController();

  @override
  void initState() {
    super.initState();
    try {
      _dropdownController = Get.find();
    } catch (e) {
      _dropdownController = Get.put(DropdownController());
    }

    initialize();
  }

  void initialize() {
    List<String> items = [
      'sunday',
      'monday',
      'tuesday',
      'wednesday',
      'thursday',
      'friday',
      'saturday'
    ];

    _dropdownController.prepareItemsList(items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Choose today's day"),
            Obx(() => DropdownButton(
              value: _dropdownController.dropdownValue.value,
              icon: const Icon(Icons.arrow_circle_down),
              items: _dropdownController.menuItems,
              onChanged: (String? newValue) {
                _dropdownController.dropdownValue.value = newValue!;
              },
            ))
          ],
        ),
      ),
    );
  }
}
