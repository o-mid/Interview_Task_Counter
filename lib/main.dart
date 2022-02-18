import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voltranapp_interview/pages/home/view/homePage.dart';
import 'pages/home/binding/homeBinding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      getPages: [
        GetPage(name: "/home", page: () => HomePage(), binding: HomeBinding()),
      ],
    );
  }
}
