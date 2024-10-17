import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 4;
  var name = [
    'CHO YOUNG SANG',
    'JIN SUN MI',
    'HONG GIL DONG',
    'KIM MIN SU'
  ];

  void addName(String x) {
    setState(() {
      if (x.isNotEmpty) {
        name.add(x);
        a++;
      }
    });
  }

  void delName(int x) {
    setState(() {
      name.removeAt(x);
      a--;
    });
  }

  void showDialogUI() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogUI(addName: addName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(a.toString()),
      ),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (c, i) {
          return ListTile(
            leading: Image.asset('image/kookmin.png', width: 80),
            title: Text(name[i]),
            trailing: ElevatedButton(
              child: Text('삭제'),
              onPressed: () {
                delName(i);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showDialogUI,
        child: Icon(Icons.add),
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({super.key, required this.addName});
  final Function(String) addName; // addName의 타입을 명시
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(controller: controller),
            TextButton(
              child: Text('완료'),
              onPressed: () {
                addName(controller.text);
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('취소'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}