
class Info {

  String seed;
  int results;
  int page;
  String version;

	Info.fromJsonMap(Map<String, dynamic> map): 
		seed = map["seed"],
		results = map["results"],
		page = map["page"],
		version = map["version"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['seed'] = seed;
		data['results'] = results;
		data['page'] = page;
		data['version'] = version;
		return data;
	}
}
