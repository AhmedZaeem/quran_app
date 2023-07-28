class Verses {
  int? id;
  String? verseKey;
  String? textUthmani;

  Verses({int? id, String? verseKey, String? textUthmani}) {
    if (id != null) {
      id = id;
    }
    if (verseKey != null) {
      verseKey = verseKey;
    }
    if (textUthmani != null) {
      textUthmani = textUthmani;
    }
  }

  Verses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    verseKey = json['verse_key'];
    textUthmani = json['text_uthmani'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['verse_key'] = verseKey;
    data['text_uthmani'] = textUthmani;
    return data;
  }
}
