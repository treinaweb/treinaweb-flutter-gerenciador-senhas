
import 'package:treinapass/models/login.dart';
import 'package:treinapass/utils/db_util.dart';

class LoginService {

  void addLogin(Login login) {
    DbUtil.insertData('login', login.toMap());
  }
}