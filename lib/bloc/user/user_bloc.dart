import 'package:demotinder/model/user.dart';
import 'package:demotinder/repo/repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final Repository _repository = Repository();
  final BehaviorSubject<List<User>> _subject = BehaviorSubject<List<User>>();

  getUser(BuildContext context) async {
    List<User> response = await _repository.generateListUsers(context);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<User>> get subject => _subject;
}

final bloc = UserBloc();
