import 'package:flutter/material.dart';
import 'package:lab7_100/main.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final List<ListItem> _fruits = [
    ListItem(1, 'เพศ'),
    ListItem(2, 'หญิง'),
    ListItem(3, 'ชาย'),
  ];

  late List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  late ListItem _selectedItem;

  @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropdownMenuItem(_fruits);
    _selectedItem = _dropdownMenuItems[0].value!;
  }

  List<DropdownMenuItem<ListItem>> buildDropdownMenuItem(
      List<ListItem> fruits) {
    List<DropdownMenuItem<ListItem>> items = [];
    // สร้างดรอปดาวน์
    for (ListItem listItem in fruits) {
      items.add(DropdownMenuItem(
        value: listItem,
        child: Text(listItem.name),
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("โปรเเกรมคำนวณค่าดัชนีมวลกาย BMI"),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          DropdownButton(
            value: _selectedItem,
            items: _dropdownMenuItems,
            onChanged: (value) {
              setState(() {
                _selectedItem = value!;
              });
            },
          ),
          ListTile(
            leading: Text('น้ำหนัก'),
            title: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: '(kg)'),
            ),
          ),
          ListTile(
            leading: Text('ส่วนสูง'),
            title: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: '(cm)'),
            ),
          ),
        ],
      )),
    );
  }
}

class ListItem {
  final String name;
  final int value;

  ListItem(this.value, this.name);
}