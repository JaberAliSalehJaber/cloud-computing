import 'package:flutter/material.dart'; // استيراد مكتبة المواد الجاهزة في Flutter
import 'package:shared_preferences/shared_preferences.dart'; // استيراد مكتبة لإدارة البيانات المحلية
import 'dart:convert'; // استيراد مكتبة لتحويل البيانات إلى ومن JSON

class SecondScreenee extends StatefulWidget {
  @override
  _SecondScreeneeState createState() => _SecondScreeneeState();
}

class _SecondScreeneeState extends State<SecondScreenee> {
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

  void updateDataInSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedData = dataList.map((data) => jsonEncode(data)).toList();
    await prefs.setStringList('dataListNew', encodedData); // تحديث البيانات في الذاكرة المحلية
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('عرض البيانات'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (dataList.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data = dataList[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 16.0),
                    child: ListTile(
                      title: Text('الاسم: ${data['name']}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('العمر: ${data['age']}'),
                          Text('عدد أفراد الأسرة: ${data['familyMembers']}'),
                          Text('نوع السكن: ${data['type']}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _editData(index);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _deleteData(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            if (dataList.isEmpty)
              Text(
                'لا توجد بيانات محفوظة',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }

  void _editData(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String name = dataList[index]['name'];
        int age = dataList[index]['age'];
        int familyMembers = dataList[index]['familyMembers'];
        String type = dataList[index]['type'];

        TextEditingController nameController = TextEditingController(text: name);
        TextEditingController ageController = TextEditingController(text: age.toString());
        TextEditingController familyMembersController = TextEditingController(text: familyMembers.toString());
        String dropdownValue = type;

        return AlertDialog(
          title: Text('تعديل البيانات'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'الاسم'),
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(labelText: 'العمر'),
                keyboardType: TextInputType.number,
              ),
              TextField(
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
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('إلغاء'),
            ),
            TextButton(
              onPressed: () {
                Map<String, dynamic> updatedData = {
                  'name': nameController.text,
                  'age': int.tryParse(ageController.text) ?? 0,
                  'familyMembers': int.tryParse(familyMembersController.text) ?? 0,
                  'type': dropdownValue,
                };
                editData(index, updatedData);
                Navigator.of(context).pop();
              },
              child: Text('حفظ التعديل'),
            ),
          ],
        );
      },
    );
  }

  void editData(int index, Map<String, dynamic> updatedData) {
    setState(() {
      dataList[index] = updatedData;
    });
    updateDataInSharedPreferences();
  }

  void _deleteData(int index) {
    setState(() {
      dataList.removeAt(index);
    });
    updateDataInSharedPreferences();
  }
}
