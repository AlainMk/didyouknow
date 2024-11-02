import 'package:didyouknow/didyouknow/data/models/fact.dart';

class FactDetails {
  final String id;
  final String title;
  final String factSnippet;
  final String imageUrl;
  final ContentType type;
  final List<FactSlide> slides;

  FactDetails({
    required this.id,
    required this.title,
    required this.factSnippet,
    required this.imageUrl,
    required this.type,
    required this.slides,
  });

  // Factory constructor to create FactDetails from JSON
  factory FactDetails.fromJson(Map<String, dynamic> json) {
    return FactDetails(
      id: json['id'] as String,
      title: json['title'] as String,
      factSnippet: json['factSnippet'] as String,
      imageUrl: json['imageUrl'] as String,
      type: ContentType.values.byName(json['type']),
      slides:
          (json['slides'] as List<dynamic>).map((slideJson) => FactSlide.fromJson(slideJson as Map<String, dynamic>)).toList(),
    );
  }

  // Convert FactDetails to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'factSnippet': factSnippet,
      'imageUrl': imageUrl,
      'type': type.name,
      'slides': slides.map((slide) => slide.toJson()).toList(),
    };
  }
}

// Slide class for each slide element
class FactSlide {
  final String title;
  final String? imageUrl;
  final String? videoUrl;
  final String description;

  FactSlide({
    required this.title,
    this.imageUrl,
    this.videoUrl,
    required this.description,
  });

  // Factory constructor to create FactSlide from JSON
  factory FactSlide.fromJson(Map<String, dynamic> json) {
    return FactSlide(
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String?,
      videoUrl: json['videoUrl'] as String?,
      description: json['description'] as String,
    );
  }

  // Convert FactSlide to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
      'description': description,
    };
  }
}
