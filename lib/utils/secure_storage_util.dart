
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageUtil {
  final _storage = FlutterSecureStorage();

  Future insertData(String key, String value) async {
    _storage.write(key: key, value: value);
  }
}