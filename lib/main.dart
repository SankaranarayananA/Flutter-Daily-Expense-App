import 'package:flutter/material.dart';
import 'controller/appdata.dart';
import 'presentations/list_page/list_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppData.initItem();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:  Homepage(),

    );}}



