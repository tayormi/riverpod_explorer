class Suggestion {
  Suggestion({
    required this.activity,
    required this.type,
  });

  final String activity;
  final String type;

  factory Suggestion.fromJson(Map<String, dynamic> json) =>
      Suggestion(activity: json["activity"], type: json["type"]);
}
