import 'TranslatedName.dart';

class Chapters {
  int? id;
  String? revelationPlace;
  int? revelationOrder;
  bool? bismillahPre;
  String? nameSimple;
  String? nameComplex;
  String? nameArabic;
  int? versesCount;
  List<int>? pages;
  TranslatedName? translatedName;

  Chapters(
      {int? id,
      String? revelationPlace,
      int? revelationOrder,
      bool? bismillahPre,
      String? nameSimple,
      String? nameComplex,
      String? nameArabic,
      int? versesCount,
      List<int>? pages,
      TranslatedName? translatedName}) {
    if (id != null) {
      id = id;
    }
    if (revelationPlace != null) {
      revelationPlace = revelationPlace;
    }
    if (revelationOrder != null) {
      revelationOrder = revelationOrder;
    }
    if (bismillahPre != null) {
      bismillahPre = bismillahPre;
    }
    if (nameSimple != null) {
      nameSimple = nameSimple;
    }
    if (nameComplex != null) {
      nameComplex = nameComplex;
    }
    if (nameArabic != null) {
      nameArabic = nameArabic;
    }
    if (versesCount != null) {
      versesCount = versesCount;
    }
    if (pages != null) {
      pages = pages;
    }
    if (translatedName != null) {
      translatedName = translatedName;
    }
  }

  Chapters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    revelationPlace = json['revelation_place'];
    revelationOrder = json['revelation_order'];
    bismillahPre = json['bismillah_pre'];
    nameSimple = json['name_simple'];
    nameComplex = json['name_complex'];
    nameArabic = json['name_arabic'];
    versesCount = json['verses_count'];
    pages = json['pages'].cast<int>();
    translatedName = json['translated_name'] != null
        ? TranslatedName.fromJson(json['translated_name'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['revelation_place'] = revelationPlace;
    data['revelation_order'] = revelationOrder;
    data['bismillah_pre'] = bismillahPre;
    data['name_simple'] = nameSimple;
    data['name_complex'] = nameComplex;
    data['name_arabic'] = nameArabic;
    data['verses_count'] = versesCount;
    data['pages'] = pages;
    if (translatedName != null) {
      data['translated_name'] = translatedName!.toJson();
    }
    return data;
  }
}
