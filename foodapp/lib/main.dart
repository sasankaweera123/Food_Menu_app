import 'package:flutter/material.dart';
import 'package:foodapp/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue.withOpacity(0.3),
        primarySwatch: Colors.blue,
        primaryColor: Colors.greenAccent,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.green),
        ),
      ),
      home: HomePage(),
    );
  }
}