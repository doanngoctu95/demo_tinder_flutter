
class Id {

  String name;
  String value;

	Id.fromJsonMap(Map<String, dynamic> map): 
		name = map["name"],
		value = map["value"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = name;
		data['value'] = value;
		return data;
	}
}
