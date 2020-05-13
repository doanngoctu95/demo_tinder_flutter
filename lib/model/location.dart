
class Location {

  String street;
  String city;
  String state;
  int postcode;

	Location.fromJsonMap(Map<String, dynamic> map): 
		street = map["street"],
		city = map["city"],
		state = map["state"],
		postcode = map["postcode"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['street'] = street;
		data['city'] = city;
		data['state'] = state;
		data['postcode'] = postcode;
		return data;
	}
}
