class TranslatedName {
  String? languageName;
  String? name;

  TranslatedName({String? languageName, String? name}) {
    if (languageName != null) {
      languageName = languageName;
    }
    if (name != null) {
      name = name;
    }
  }

  TranslatedName.fromJson(Map<String, dynamic> json) {
    languageName = json['language_name'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['language_name'] = languageName;
    data['name'] = name;
    return data;
  }
}
