class UserTest {
  int _id;
  String _name;
  String _babyNickname;
  String _babyBirth;

  int get id => _id;

  String get name => _name;

  String get babyBirth => _babyBirth;

  String get babyNickname => _babyNickname;

  UserTest(this._id, this._name, this._babyNickname, this._babyBirth);

  factory UserTest.fromJson(Map<String, dynamic> jsonData) {
    return UserTest(
      jsonData['id'],
      jsonData['name'],
      jsonData['nickname'],
      jsonData['birth'],
    );
  }
}
