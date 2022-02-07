import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:imtihonthird/router/myrouter.dart';
import 'package:imtihonthird/screens/home_page.dart';
import 'package:imtihonthird/screens/tasbeh/tasbeh_page.dart';
import 'package:imtihonthird/service/hive_service.dart';

void main() async {
  await Hive.initFlutter();
  ServiceHive.regitserAllAdapters();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      initialRoute: "/",
      onGenerateRoute: (settings) => RouterGenerator.onGenerateRoute(settings)
    );
  }
}
