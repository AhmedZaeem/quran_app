import 'Chapters.dart';

class AllSourModule {
  List<Chapters>? chapters;

  AllSourModule({List<Chapters>? chapters}) {
    if (chapters != null) {
      chapters = chapters;
    }
  }

  AllSourModule.fromJson(Map<String, dynamic> json) {
    if (json['chapters'] != null) {
      chapters = <Chapters>[];
      json['chapters'].forEach((v) {
        chapters!.add(Chapters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chapters != null) {
      data['chapters'] = chapters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
