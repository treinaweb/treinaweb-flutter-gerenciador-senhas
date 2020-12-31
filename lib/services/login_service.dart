
import 'package:treinapass/models/login.dart';
import 'package:treinapass/utils/db_util.dart';
import 'package:treinapass/utils/encrypt_util.dart';

class LoginService {
  List<Login> _loginList = [];
  EncryptUtil en = EncryptUtil();

  void addLogin(Login login, String senhaUsuario) async {
    var senhaCriptografada = await en.encryptString(login.senha, senhaUsuario);
    print(senhaCriptografada);
    final novoLogin = Login(
      id: login.id,
      titulo: login.titulo,
      descricao: login.descricao,
      username: login.username,
      url: login.url,
      senha: senhaCriptografada
    );
    DbUtil.insertData('login', novoLogin.toMap());
  }

  Future<List> getAllLogin() async {
    final dataList = await DbUtil.getData('login');
    _loginList = dataList.map((logins) => Login.fromMap(logins)).toList();
    return _loginList;
  }

  Future<Login> getLogin(int id) async {
    String whereString = "id = ?";
    List<dynamic> whereArgument = [id];
    final dataList = await DbUtil.getDataId('login', whereString, whereArgument);
    return Login.fromMap(dataList.first);
  }


}