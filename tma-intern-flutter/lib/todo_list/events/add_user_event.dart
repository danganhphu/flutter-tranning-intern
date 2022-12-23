import '../base/base.dart';

class AddUserEvent extends BaseEvent {
  String name;

  AddUserEvent(this.name);
}