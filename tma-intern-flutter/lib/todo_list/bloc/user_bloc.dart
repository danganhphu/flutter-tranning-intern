import 'dart:async';
import 'dart:math';

import '../base/base.dart';
import '../models/user.dart';
import '../events/events.dart';

class UserBloc extends BaseBloc {
  StreamController<List<User>> _userListStreamCtrl = StreamController<List<User>>();
  Stream<List<User>> get userListStream => _userListStreamCtrl.stream;

  final _randomInt =  Random();

  final List<User> _userList = [];
  _addUser(User user) {
    _userList.add(user);
    _userListStreamCtrl.sink.add(_userList);
  }

  _deleteUser(User user) {
    _userList.remove(user);
    _userListStreamCtrl.sink.add(_userList);
  }

  @override
  void dispatchEvent(BaseEvent event) {
    if (event is AddUserEvent) {
      User user = User(_randomInt.nextInt(10000), event.name);
      _addUser(user);
      // print(event.name);
    } else if (event is DeleteUserEvent) {
      _deleteUser(event.user);
      print('delete event');
    }
  }
  @override
  void dispose() {
    super.dispose();
    _userListStreamCtrl.close();
  }
}