import 'package:hive/hive.dart';

class AuthBox {
  static const String _boxName = 'authBox';
  static Box<String>? _box;
  static Future<void> initialize() async {
    _box = await Hive.openBox<String>(_boxName); // Open the box
    print('AuthBox initialized: $_box');
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
}
