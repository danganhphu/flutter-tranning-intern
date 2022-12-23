class User {
  int _id;
  String _name;

  User(this._id, this._name);

  set name(String value) {
    _name = value;
  }

  set id(int value) {
    _id = value;
  }

  int get id => _id;
  String get name => _name;


  Map<String, dynamic> toJson() => {
    'id': _id,
    'name': _name,
  };

}