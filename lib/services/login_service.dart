
import 'package:treinapass/models/login.dart';
import 'package:treinapass/utils/db_util.dart';

class LoginService {
  List<Login> _loginList = [];

  void addLogin(Login login) {
    DbUtil.insertData('login', login.toMap());
  }

  Future<List> getAllLogin() async {
    final dataList = await DbUtil.getData('login');
    _loginList = dataList.map((logins) => Login.fromMap(logins)).toList();
    return _loginList;
  }


}