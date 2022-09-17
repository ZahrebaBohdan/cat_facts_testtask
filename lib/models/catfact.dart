import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

part 'catfact.g.dart';

@HiveType(typeId: 0)
class CatFact extends HiveObject {
  @HiveField(0)
  String? fact;
  CatFact({this.fact});
  factory CatFact.fromJson(Map<String, dynamic> json) {
    return CatFact(
      fact: json['fact'],
    );
  }
}

Future<CatFact> getCatFact() async {
  try {
    final url = Uri.parse('https://catfact.ninja/fact');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return CatFact.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  } catch (e) {
    throw Exception(e);
  }
}

Future<String> getImage() async {
  return 'https://cataas.com/cat';
}
