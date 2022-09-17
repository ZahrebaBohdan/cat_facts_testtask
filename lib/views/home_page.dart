import 'package:cat_facts_testtask/constants.dart';
import 'package:cat_facts_testtask/main.dart';
import 'package:cat_facts_testtask/views/history_page.dart';
import 'package:cat_facts_testtask/views/widgets/glassmorphism_card.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/catfact.dart';
import 'widgets/fact_builder.dart';

List facts = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late Box<String> catFactsBox;

  @override
  void initState() {
    super.initState();
    // getCatFact();
    // catFactsBox = Hive.box(factsBox);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.history),
        label: const Text('History'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HistoryPage(),
            ),
          );
        },
      ),
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.lightbulb),
            Text('Cat Trivia'),
          ],
        ),
        actions: [
          Row(
            children: [
              TextButton(
                onPressed: (() {
                  setState(() {
                    facts.add(FactBuilder(
                      getFact: getCatFact(),
                      getImage: getImage(),
                    ));
                  });
                  print(facts);
                }),
                child: Row(
                  children: [
                    Text(
                      'Another fact!',
                      style: TextStyle(
                        color: kColorScheme.onPrimary,
                      ),
                    ),
                    Icon(
                      Icons.add,
                      color: kColorScheme.onPrimary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: facts.length,
          itemBuilder: (context, index) => facts[index]),
    );
  }
}
