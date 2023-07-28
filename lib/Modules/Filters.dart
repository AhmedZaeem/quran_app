class Filters {
  String? pageNumber;
  String? chapterNumber;

  Filters({String? pageNumber, String? chapterNumber}) {
    if (pageNumber != null) {
      pageNumber = pageNumber;
    }
    if (chapterNumber != null) {
      chapterNumber = chapterNumber;
    }
  }

  Filters.fromJson(Map<String, dynamic> json) {
    pageNumber = json['page_number'];
    chapterNumber = json['chapter_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page_number'] = pageNumber;
    data['chapter_number'] = chapterNumber;
    return data;
  }
}
