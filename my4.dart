import 'package:flutter/material.dart';

class SecondScreenrr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('4الواجهة الثانوية'),
      ),
      body: Center(
        child: Text(
          'محتوى الواجهة الثانوية',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}