import 'package:validators/validators.dart';

class Validators{
  bool validateUsername(String username) => isEmail(username);
  bool validatePassword(String password) => isLength(password, 6);
}