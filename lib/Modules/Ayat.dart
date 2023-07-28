import 'Meta.dart';
import 'Verses.dart';

class Ayat {
  List<Verses>? verses;
  Meta? meta;

  Ayat({List<Verses>? verses, Meta? meta}) {
    if (verses != null) {
      verses = verses;
    }
    if (meta != null) {
      meta = meta;
    }
  }

  Ayat.fromJson(Map<String, dynamic> json) {
    if (json['verses'] != null) {
      verses = <Verses>[];
      json['verses'].forEach((v) {
        verses!.add(Verses.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (verses != null) {
      data['verses'] = verses!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}
