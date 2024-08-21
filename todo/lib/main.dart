import 'package:flutter/material.dart';
import 'package:todo/logic/shared.dart';
import 'package:todo/logic/sqf.dart';
import 'package:todo/screens/LogIN.dart';
void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.cachIntialization();

   WidgetsFlutterBinding.ensureInitialized();
  sqf sqldb = sqf();
  await sqldb.db;
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo',
      home: logIN(),
    );
  }
}
