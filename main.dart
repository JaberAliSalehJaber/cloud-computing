import 'package:flutter/material.dart'; // استيراد مكتبة المواد الجاهزة في Flutter
import 'package:url_launcher/url_launcher.dart'; // استيراد مكتبة لفتح روابط الويب
import 'hani.dart'; // استيراد ملف آخر

void main() {
  runApp(LoginApp()); // تشغيل التطبيق الرئيسي
}

// تعريف الصفحة الرئيسية للتطبيق
class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), // تعيين السمة الظلامية للتصميم
      initialRoute: '/', // الصفحة الرئيسية
      routes: {
        '/': (context) => EmailLogin(), // الصفحة الرئيسية
        '/new_screen': (context) => NewScreen(), // صفحة أخرى
      },
    );
  }
}

// تعريف صفحة تسجيل الدخول
class EmailLogin extends StatefulWidget {
  @override
  _EmailLoginState createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  TextEditingController emailController = TextEditingController(); // متحكم لحقل البريد الإلكتروني
  TextEditingController passwordController = TextEditingController(); // متحكم لحقل كلمة المرور

  final String validEmail = 'aaa'; // بيانات البريد الإلكتروني الصالحة
  final String validPassword = '111'; // بيانات كلمة المرور الصالحة

  bool isDarkMode = true; // متغيّر لتتبع حالة الوضع الليلي/النهاري

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل الدخول'), // عنوان شريط التطبيق
        actions: <Widget>[
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.wb_sunny : Icons.brightness_3,
              color: Colors.yellow,
            ),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode; // تبديل وضع الليل والنهار
              });
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'اسم المستخدم',
                style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
              ),
              accountEmail: Text(
                'user@example.com',
                style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'خيار 1',
                style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
              ),
              onTap: () {
                // اتخاذ الإجراء عند النقر على الخيار 1
              },
            ),
            ListTile(
              title: Text(
                'خيار 2',
                style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
              ),
              onTap: () {
                // اتخاذ الإجراء عند النقر على الخيار 2
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDarkMode
                ? [Colors.black, Colors.blueGrey]
                : [Color.fromARGB(255, 15, 121, 227), const Color.fromARGB(255, 47, 30, 233)],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: isDarkMode ? Colors.blue : Colors.blue,
                radius: 50.0,
                child: Icon(
                  Icons.face,
                  size: 60.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 32.0),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'اسم المستخدم',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'كلمة المرور',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  if (emailController.text == validEmail &&
                      passwordController.text == validPassword) {
                    Navigator.pushNamed(context, '/new_screen'); // التنقل إلى صفحة أخرى عند تسجيل الدخول
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'خطأ في تسجيل الدخول',
                            style: TextStyle(color: isDarkMode ? Colors.red : Colors.red),
                          ),
                          content: Text(
                            'اسم المستخدم أو كلمة المرور غير صحيحة. الرجاء المحاولة مرة أخرى.',
                            style: TextStyle(color: isDarkMode ? Colors.black : Colors.black),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'موافق',
                                style: TextStyle(color: isDarkMode ? Colors.blue : Colors.blue),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(color: isDarkMode ? Colors.white : Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(isDarkMode ? Colors.blue : Colors.blue),
                ),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () async {
                  final phone = "+967777704977";
                  final url = "https://api.whatsapp.com/send?phone=$phone";

                  if (await canLaunch(url)) {
                    await launch(url); // فتح WhatsApp عند النقر على الزر
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('خطأ في فتح WhatsApp'),
                          content: Text(
                            'تأكد من تثبيت تطبيق WhatsApp على جهازك.',
                            style: TextStyle(color: isDarkMode ? Colors.black : Colors.black),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'موافق',
                                style: TextStyle(color: isDarkMode ? Colors.blue : Colors.blue),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text(
                  'الواتساب',
                  style: TextStyle(color: isDarkMode ? Colors.white : Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(isDarkMode ? Colors.green : Colors.green),
                ),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () async {
                  final facebookProfileUrl =
                      "https://www.facebook.com/profile.php?id=100026771029145";

                  if (await canLaunch(facebookProfileUrl)) {
                    await launch(facebookProfileUrl); // فتح الرابط عند النقر على الزر
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('خطأ في فتح الرابط'),
                          content: Text(
                            'تأكد من تثبيت تطبيق متصفح الإنترنت على جهازك.',
                            style: TextStyle(color: isDarkMode ? Colors.black : Colors.black),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'موافق',
                                style: TextStyle(color: isDarkMode ? Colors.blue : Colors.blue),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text(
                  'الفيسبوك',
                  style: TextStyle(color: isDarkMode ? Colors.white : Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(isDarkMode ? Colors.blue : Colors.blue),
                ),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () async {
                  final phoneNumber = "+967773580632";
                  final url = "tel:$phoneNumber";

                  if (await canLaunch(url)) {
                    await launch(url); // إجراء مكالمة هاتفية عند النقر على الزر
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('خطأ في الاتصال'),
                          content: Text(
                            'تأكد من توفر تطبيق الهاتف على جهازك.',
                            style: TextStyle(color: isDarkMode ? Colors.black : Colors.black),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'موافق',
                                style: TextStyle(color: isDarkMode ? Colors.blue : Colors.blue),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text(
                  'التلفون',
                  style: TextStyle(color: isDarkMode ? Colors.white : Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(isDarkMode ? Colors.red : Colors.red),
                ),
              ),
              SizedBox(height: 32.0),
              SizedBox(height: 50.0),
              Text(
                'تطوير هاني. حابر. زيدان',
                style: TextStyle(
                  fontSize: 14.0,
                  color: isDarkMode ? Colors.grey : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
