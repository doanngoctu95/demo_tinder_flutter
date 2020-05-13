import 'info.dart';
import 'results.dart';

class User {
  User({this.results, this.info});

  List<Results> results;
  Info info;

  User.fromJsonMap(Map<String, dynamic> map)
      : results = List<Results>.from(
            map["results"].map((it) => Results.fromJsonMap(it))),
        info = Info.fromJsonMap(map["info"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] =
        results != null ? this.results.map((v) => v.toJson()).toList() : null;
    data['info'] = info == null ? null : info.toJson();
    return data;
  }
}
