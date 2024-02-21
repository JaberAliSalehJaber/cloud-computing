import 'package:flutter/material.dart';

class SecondScreenhh extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreenhh> {
  String inputText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('واجهة الحذف'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background_image.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: (text) {
                    setState(() {
                      inputText = text;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'ادخل الاسم أو الـ ID',
                    labelStyle: TextStyle(color: Colors.blue),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    inputText = '';
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: Text(
                  'حذف',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 40,),
              Text(
                'القيمة المُدخلة: $inputText',
                style: TextStyle(fontSize: 24, fontFamily: 'Roboto', fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondScreen {
}
