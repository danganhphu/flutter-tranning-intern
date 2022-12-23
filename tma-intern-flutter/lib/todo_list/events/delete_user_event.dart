import '../base/base.dart';
import '../models/user.dart';

class DeleteUserEvent extends BaseEvent{
  User user;

  DeleteUserEvent(this.user);
}