import 'dart:convert';
import 'dart:math';

import 'package:didyouknow/didyouknow/data/models/fact.dart';
import 'package:didyouknow/didyouknow/data/models/fact_details.dart';
import 'package:flutter/services.dart' show rootBundle;

class FactApi {
  Future<Fact> loadFactOfTheDay() async {
    // Load all cards from JSON
    final String jsonString = await rootBundle.loadString('assets/mock/fact_cards.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    final List<Fact> cards = jsonData.map((json) => Fact.fromJson(json)).toList();

    // Select a new random card
    final random = Random();
    final randomCard = cards[random.nextInt(cards.length)];

    return randomCard;
  }

  Future<FactDetails?> loadFactDetails(String id) async {
    final String jsonString = await rootBundle.loadString('assets/mock/fact_details.json');
    final List<dynamic> jsonData = json.decode(jsonString);

    // Find the detail by ID
    final Map<String, dynamic>? detailJson = jsonData.firstWhere(
      (json) => json['id'] == id,
      orElse: () => null,
    );

    return detailJson != null ? FactDetails.fromJson(detailJson) : null;
  }
}
