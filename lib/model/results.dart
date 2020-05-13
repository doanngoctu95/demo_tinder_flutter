import 'dart:math';
import 'package:demotinder/model/picture.dart';
import 'id.dart';
import 'location.dart';
import 'login.dart';
import 'name.dart';

class Results {

  String gender;
  Name name;
  Location location;
  String email;
  Login login;
  String dob;
  String registered;
  String phone;
  String cell;
  Id id;
  Picture picture;
  String nat;

  int userId;

	Results.fromJsonMap(Map<String, dynamic> map): 
		gender = map["gender"],
		name = Name.fromJsonMap(map["name"]),
		location = Location.fromJsonMap(map["location"]),
		email = map["email"],
		login = Login.fromJsonMap(map["login"]),
		dob = map["dob"],
		registered = map["registered"],
		phone = map["phone"],
		cell = map["cell"],
		id = Id.fromJsonMap(map["id"]),
		picture = Picture.fromJsonMap(map["picture"]),
		nat = map["nat"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['gender'] = gender;
		data['name'] = name == null ? null : name.toJson();
		data['location'] = location == null ? null : location.toJson();
		data['email'] = email;
		data['login'] = login == null ? null : login.toJson();
		data['dob'] = dob;
		data['registered'] = registered;
		data['phone'] = phone;
		data['cell'] = cell;
		data['id'] = id == null ? null : id.toJson();
		data['picture'] = picture == null ? null : picture.toJson();
		data['nat'] = nat;
		return data;
	}
}
