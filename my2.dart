import 'package:flutter/material.dart'; // استيراد مكتبة المواد الجاهزة في Flutter
import 'package:shared_preferences/shared_preferences.dart'; // استيراد مكتبة لإدارة البيانات المحلية
import 'dart:convert'; // استيراد مكتبة لتحويل البيانات إلى ومن JSON

class SecondScreenww extends StatefulWidget {
  @override
  _SecondScreenwwState createState() => _SecondScreenwwState();
}

class _SecondScreenwwState extends State<SecondScreenww> {
  TextEditingController nameController = TextEditingController(); // متحكم لحقل الاسم
  TextEditingController ageController = TextEditingController(); // متحكم لحقل العمر
  TextEditingController familyMembersController = TextEditingController(); // متحكم لحقل عدد أفراد الأسرة
  String dropdownValue = 'ملكية'; // قيمة الافتراضية لقائمة السقوط
  List<Map<String, dynamic>> dataList = []; // قائمة لتخزين البيانات

  @override
  void initState() {
    super.initState();
    loadData(); // استدعاء دالة تحميل البيانات عند بدء التشغيل
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedData = prefs.getStringList('dataListNew');
    if (savedData != null) {
      setState(() {
        dataList = savedData.map((data) => jsonDecode(data) as Map<String, dynamic>).toList();
      });
    }
  }

  void saveData() async {
    String name = nameController.text;
    int? age = int.tryParse(ageController.text);
    int? familyMembers = int.tryParse(familyMembersController.text);
    if (name.isNotEmpty && age != null && familyMembers != null) {
      Map<String, dynamic> data = {
        'name': name,
        'age': age,
        'familyMembers': familyMembers,
        'type': dropdownValue,
      };
      SharedPreferences prefs = await SharedPreferences.getInstance();
      dataList.add(data); // إضافة البيانات الجديدة إلى القائمة
      List<String> encodedData = dataList.map((data) => jsonEncode(data)).toList();
      await prefs.setStringList('dataListNew', encodedData); // حفظ البيانات في الذاكرة المحلية
      nameController.clear();
      ageController.clear();
      familyMembersController.clear();
      setState(() {
        dropdownValue = 'ملكية'; // إعادة تعيين القيم إلى القيم الافتراضية
      });
      loadData(); // إعادة تحميل البيانات بعد الحفظ
    }
  }

  void updateDataInSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedData = dataList.map((data) => jsonEncode(data)).toList();
    await prefs.setStringList('dataListNew', encodedData); // تحديث البيانات في الذاكرة المحلية
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إضافة شخص جديد'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'الاسم'),
            ),
            TextFormField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'العمر'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: familyMembersController,
              decoration: InputDecoration(labelText: 'عدد أفراد الأسرة'),
              keyboardType: TextInputType.number,
            ),
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['ملكية', 'إيجار']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: saveData,
              child: Text('حفظ'),
            ),
          ],
        ),
      ),
    );
  }
}
