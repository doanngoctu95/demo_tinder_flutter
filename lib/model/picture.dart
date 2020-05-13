
class Picture {

  String large;
  String medium;
  String thumbnail;

	Picture.fromJsonMap(Map<String, dynamic> map): 
		large = map["large"],
		medium = map["medium"],
		thumbnail = map["thumbnail"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['large'] = large;
		data['medium'] = medium;
		data['thumbnail'] = thumbnail;
		return data;
	}
}
