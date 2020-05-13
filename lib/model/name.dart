
class Name {

  String title;
  String first;
  String last;

	Name.fromJsonMap(Map<String, dynamic> map): 
		title = map["title"],
		first = map["first"],
		last = map["last"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['title'] = title;
		data['first'] = first;
		data['last'] = last;
		return data;
	}
}
