class Fact {
  final String id;
  final String title;
  final String factSnippet;
  final String imageUrl;
  final ContentType type;

  Fact({
    required this.id,
    required this.title,
    required this.factSnippet,
    required this.imageUrl,
    required this.type,
  });

  // Factory constructor to create Fact from JSON
  factory Fact.fromJson(Map<String, dynamic> json) {
    return Fact(
      id: json['id'] as String,
      title: json['title'] as String,
      factSnippet: json['factSnippet'] as String,
      imageUrl: json['imageUrl'] as String,
      type: ContentType.values.byName(json['type']),
    );
  }

  // Convert Fact to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'factSnippet': factSnippet,
      'imageUrl': imageUrl,
      'type': type.name,
    };
  }
}

// Enum for content type
enum ContentType { article, video, slide }
