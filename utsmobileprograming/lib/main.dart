import 'package:flutter/material.dart';
import 'package:utsmobileprograming/pages/list_jadwal.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS Mobile Programming',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
      routes: {
        '/pages/list_jadwal': (context) => ListJadwalPage(),
      },
    );
  }
}
