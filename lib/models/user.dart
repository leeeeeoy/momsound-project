import 'package:momsori/models/birth.dart';

class User {
  String _name;
  String _babyName;
  Birth _birthDate;
  String _id;
  String _password;

  String get name => _name;
  String get babyName => _babyName;
  Birth get birthDate => _birthDate;
  String get id => _id;
  String get password => _password;
}
