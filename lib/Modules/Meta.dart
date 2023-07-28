import 'Filters.dart';

class Meta {
  Filters? filters;

  Meta({Filters? filters}) {
    if (filters != null) {
      filters = filters;
    }
  }

  Meta.fromJson(Map<String, dynamic> json) {
    filters =
        json['filters'] != null ? Filters.fromJson(json['filters']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (filters != null) {
      data['filters'] = filters!.toJson();
    }
    return data;
  }
}
