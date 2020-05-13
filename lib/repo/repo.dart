import 'dart:convert';
import 'dart:math';

import 'package:demotinder/model/user.dart';
import 'package:flutter/material.dart';

class Repository {

  /// get user from asset
  Future<List<User>> generateListUsers(BuildContext context) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/data");
    print('data from file: $data');
    final jsonParse = json.decode(data);
    List<User> listUser = [];
    for(int i = 0; i < 10; i++) {
      User user = User();
      if (jsonParse != null) {
        user = User.fromJsonMap(jsonParse);
      }
      user.results[0].userId = Random().nextInt(9999); // add random user id;
      print('user id: ${user.results[0].userId}');
      listUser.add(user);
    }
    return listUser;
  }
}