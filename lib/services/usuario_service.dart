
import 'package:treinapass/models/usuario.dart';
import 'package:treinapass/utils/secure_storage_util.dart';

class UsuarioService {
  final SecureStorageUtil ss = SecureStorageUtil();

  void addUsuario(Usuario usuario) async {
    ss.insertData('nome', usuario.nome);
    ss.insertData('email', usuario.email);
    ss.insertData('senha', usuario.senha);
  }
}