import 'package:cat_facts_testtask/main.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import '../../models/catfact.dart';
import 'glassmorphism_card.dart';

class FactBuilder extends StatelessWidget {
  final Future<CatFact> getFact;
  final Future<String> getImage;
  const FactBuilder({super.key, required this.getFact, required this.getImage});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CatFact>(
      future: getFact,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // Box catFactsBox = Hive.box(factsBox);
          // catFactsBox.add(snapshot.data);
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: 200,
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  GlassContainer(
                    margin: const EdgeInsets.only(left: 100),
                    height: 50,
                    child: ListTile(
                      title: Text('${snapshot.data?.fact}'),
                      subtitle:
                          Text(DateFormat.yMMMEd().format(DateTime.now())),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: SizedBox(
                        width: 125,
                        height: 125,
                        child: FutureBuilder(
                          future: getImage,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                            
                              return Image.network(snapshot.data.toString(),
                                  fit: BoxFit.cover);
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }
                            // By default, show a loading spinner.
                            return const CircularProgressIndicator();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Text('Error');
        }
        return const Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
