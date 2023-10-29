// ignore_for_file: prefer_const_constructors
// مكتبه لتحويل الجيسون الي لغة الدارت
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Api(),
    );
  }
}

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  //  ماب
  Map receivedData = {"timezone": ""};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  async ..... awite تستخدم مع 
      floatingActionButton: FloatingActionButton(onPressed: () async {
        //  للامساك بخطاء معين
        try {
          // تخزين الجيسون داخل متغير محلي ثم جعلها تنتظر لتنفيذ الاتصال ثم تنفيذ باقي الاوامر
          Response response = await get(
              Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Cairo'));
          setState(() {
            // تخزين الجيسون بداخل متغير عام عبارة عن ماب
            receivedData = jsonDecode(response.body);
          });
          print(receivedData);
          // تخذين الخطاء داخل متغير 
        } catch (e) {
          //  طباعة الخطاء المخذن داخل متغير
          print("ERROE IS : $e");
        }
      }),
      body: Center(
          child: Text(
            //  طريقة استدعاء الماب داخل تيكست نكتب اسم الماب ثم الكي بداخل الاقواس
        receivedData["timezone"],
        style: TextStyle(color: Colors.black, fontSize: 30),
      )),
    );
  }
}
