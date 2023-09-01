import 'package:hive/hive.dart';

class AuthBox {
  static const String _boxName = 'authBox';
  static Box<String>? _box;
  static Future<void> initialize() async {
    _box = await Hive.openBox<String>(_boxName); // Open the box
  }

  static String? getToken() {
    return _box?.get('token');
  }

  static void setToken(String token) {
    _box?.put('token', token);
  }

  static void removeToken() {
    _box?.delete('token');
  }

  static String? getFileToken() {
    return _box?.get('tokenFile');
  }

  static void setFileToken(String token) {
    _box?.put('tokenFile', token);
  }

  static void removeFileToken() {
    _box?.delete('tokenFile');
  }
}
