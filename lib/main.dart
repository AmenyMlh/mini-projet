// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_projet/Components/db.dart';
import 'package:mini_projet/homepage.dart';
import 'Components/LoginPage.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  MyDatabase.db.initDB();
  final box = GetStorage();
  box.write("session", false);
  print("storage inited");
  runApp(GetMaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
  
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home: HomePage(),);
  }
}