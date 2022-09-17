import 'package:cat_facts_testtask/constants.dart';
import 'package:cat_facts_testtask/views/home_page.dart';
import 'package:cat_facts_testtask/views/widgets/glassmorphism_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_rounded,
            color: kColorScheme.onPrimary,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: facts.length,
          itemBuilder: (context, index) => GlassContainer(
                child: ListTile(title: facts[index]),
              )),
    );
  }
}
