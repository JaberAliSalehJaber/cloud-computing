LoginApp (StatelessWidget)
└── MaterialApp
    ├── theme: ThemeData.dark()
    ├── initialRoute: '/'
    ├── routes
    │   ├── '/': (EmailLogin)
    │   └── '/new_screen': (NewScreen)
    └── EmailLogin (StatefulWidget)
        ├── Scaffold
        │   ├── AppBar
        │   │   └── Text
        │   ├── Drawer
        │   │   └── ListView
        │   │       ├── UserAccountsDrawerHeader
        │   │       │   ├── Text
        │   │       │   ├── Text
        │   │       │   ├── CircleAvatar
        │   │       ├── ListTile
        │   │       │   └── Text
        │   │       ├── ListTile
        │   │       │   └── Text
        │   └── body (Container)
        │       ├── Padding
        │       │   └── Column
        │       │       ├── CircleAvatar
        │       │       ├── SizedBox
        │       │       ├── TextFormField
        │       │       ├── TextFormField
        │       │       ├── ElevatedButton
        │       │       ├── ElevatedButton
        │       │       ├── ElevatedButton
        │       │       ├── ElevatedButton
        │       │       └── Text
        └── NewScreen (StatefulWidget)
            ├── Scaffold
            │   ├── AppBar
            │   │   └── Row
            │   │       ├── Text
            │   │       ├── SizedBox
            │   ├── body (Container)
            │   │   ├── Center
            │   │   │   └── Column
            │   │   │       ├── Text
            │   │   │       ├── Text
            │   │   │       ├── SizedBox
            │   │   │       ├── ListTile
            │   │   │       │   ├── Text
            │   │   │       │   ├── Icon
            │   │   │       │   ├── Icon
            │   │   │       ├── SizedBox
            │   │   │       ├── ListTile
            │   │   │       │   ├── Text
            │   │   │       │   ├── Icon
            │   │   │       │   ├── Icon
            │   │   │       ├── SizedBox
            │   │   │       ├── ListTile
            │   │   │       │   ├── Text
            │   │   │       │   ├── Icon
            │   │   │       │   ├── Icon
            │   │   │       ├── SizedBox
            │   │   │       ├── ListTile
            │   │   │       │   ├── Text
            │   │   │       │   ├── Icon
            │   │   │       │   ├── Icon
            │   │   ├── bottomNavigationBar (Container)
            │   │   │   └── Text
            │   │   └── floatingActionButton (FAB)
            │       └── Icon
my1
SecondScreenee (StatelessWidget)
└── Scaffold
    ├── AppBar
    │   └── Text
    ├── body (Center)
    │   └── FittedBox
    │       └── DataTable
    │           ├── columns
    │           │   ├── DataColumn (Text: 'الاسم')
    │           │   ├── DataColumn (Text: 'رقم التلفون')
    │           │   ├── DataColumn (Text: 'نوع السكن')
    │           │   ├── DataColumn (Text: 'رقم البطاقة')
    │           │   └── DataColumn (Text: 'الملاحظات')
    │           └── rows
    │               ├── DataRow
    │               │   ├── DataCell (Text: 'اسم المستخدم 1')
    │               │   ├── DataCell (Text: '1234567890')
    │               │   ├── DataCell (Text: 'نوع السكن 1')
    │               │   ├── DataCell (Text: '9876543210')
    │               │   └── DataCell (Text: 'ملاحظة 1')
    │               ├── DataRow
    │               │   ├── DataCell (Text: 'اسم المستخدم 2')
    │               │   ├── DataCell (Text: '5555555555')
    │               │   ├── DataCell (Text: 'نوع السكن 2')
    │               │   ├── DataCell (Text: '1111111111')
    │               │   └── DataCell (Text: 'ملاحظة 2')
    │               └── ... (You can add more rows as needed)
my2
SecondScreenww (StatelessWidget)
└── Scaffold
    ├── AppBar
    │   └── Text
    ├── body (Padding)
    │   ├── Column
    │   │   ├── Text ('ادخل الاسم:')
    │   │   ├── TextFormField (Hint: 'اسم المستخدم')
    │   │   ├── SizedBox
    │   │   ├── Text ('ادخل الرقم:')
    │   │   ├── TextFormField (Hint: 'الرقم', keyboardType: TextInputType.number)
    │   │   ├── SizedBox
    │   │   ├── Text ('نوع السكان:')
    │   │   ├── DropdownButtonFormField<String>
    │   │   │   └── DropdownMenuItem<String> (Value: 'ملك', Child: Text('ملك'))
    │   │   │   └── DropdownMenuItem<String> (Value: 'يجار', Child: Text('يجار'))
    │   │   ├── SizedBox
    │   │   ├── Text ('ادخل رقم البطاقة الشخصية:')
    │   │   ├── TextFormField (Hint: 'رقم البطاقة الشخصية', keyboardType: TextInputType.number)
    │   │   ├── SizedBox
    │   │   ├── Text ('ادخل عدد أفراد الأسرة:')
    │   │   ├── TextFormField (Hint: 'عدد أفراد الأسرة', keyboardType: TextInputType.number)
    │   │   ├── SizedBox
    │   │   ├── Text ('ادخل اسم الوظيفة:')
    │   │   ├── TextFormField (Hint: 'اسم الوظيفة')
    │   │   ├── SizedBox
    │   │   ├── Text ('اكتب الملاحظات:')
    │   │   ├── TextFormField (Hint: 'الملاحظات', maxLines: 3)
    │   │   ├── SizedBox
    │   │   └── ElevatedButton (Text: 'حفظ')
 my3
 SecondScreenhh (StatefulWidget)
└── Scaffold
    ├── AppBar
    │   └── Text ('واجهة الحذف')
    ├── body (Center)
    │   └── Container
    │       ├── decoration (DecorationImage)
    │       │   └── AssetImage ('assets/background_image.jpg')
    │       ├── child (Column)
    │       │   ├── Padding
    │       │   │   ├── TextField
    │       │   │   ├── ElevatedButton
    │       │   │   ├── SizedBox
    │       │   │   └── Text ('القيمة المُدخلة: $inputText')
