import 'package:cat_facts_testtask/models/catfact.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'constants.dart';
import 'views/home_page.dart';

// const factsBox = 'catFacts';

void main() async {
  // await Hive.initFlutter();
  // await Hive.openBox<String>(factsBox);
  // Hive.registerAdapter(CatFactAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: kColorScheme),
      title: 'Cat Trivia',
      home: HomePage(),
    );
  }
}
