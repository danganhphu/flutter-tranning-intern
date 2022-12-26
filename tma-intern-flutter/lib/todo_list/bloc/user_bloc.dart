import 'dart:async';
import 'dart:math';

import '../base/base.dart';
import '../models/user.dart';
import '../events/events.dart';
import 'package:flutterproject/todo_list/database/database.dart';

class UserBloc extends BaseBloc {
  DatabaseTable _databaseTable = DatabaseTable();

  StreamController<List<User>> _userListStreamCtrl = StreamController<List<User>>();
  Stream<List<User>> get userListStream => _userListStreamCtrl.stream;

  final _randomInt =  Random();

  List<User> _userList = [];

  initData() async {
    _userList = await _databaseTable.selectAllUsers();
    if(_userList == null) {
      return;
    }
    _userListStreamCtrl.sink.add(_userList);
  }

  _addUser(User user) async {
    //thêm vào database
   await _databaseTable.insertUser(user);


    _userList.add(user);
    _userListStreamCtrl.sink.add(_userList);
  }

  _deleteUser(User user) async {
    //xoa user
    await _databaseTable.deleteUser(user);

    _userList.remove(user);
    _userListStreamCtrl.sink.add(_userList);
  }

  @override
  void dispatchEvent(BaseEvent event) {
    if (event is AddUserEvent) {
      User user = User(_randomInt.nextInt(10000), event.name);
      _addUser(user);
      print('add: ${event.name}');
    } else if (event is DeleteUserEvent) {
      _deleteUser(event.user);
      print('delete: ${event.user.name}');
    }
  }
  @override
  void dispose() {
    super.dispose();
    _userListStreamCtrl.close();
  }
}