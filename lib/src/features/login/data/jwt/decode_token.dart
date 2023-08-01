import 'dart:convert';

class DecodedToken{
  final String token;
  final Object ? payload;
  final DateTime expirationDate;

  DecodedToken(this.token, this.expirationDate, this.payload);
}

DecodedToken parseJwtPayLoad(String  token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('invalid token');
  }

  final payload = _decodeBase64(parts[1]);
  final payloadMap = json.decode(payload);
  if (payloadMap is! Map<String, dynamic>) {
    throw Exception('invalid payload');
  }

  final expirationTimestamp = payloadMap['exp'] as int;
  final expirationDate = DateTime.fromMillisecondsSinceEpoch(expirationTimestamp * 1000);

  return DecodedToken(token, expirationDate, payloadMap);
}

String _decodeBase64(String str) {
  String output = str.replaceAll('-', '+').replaceAll('_', '/');

  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw Exception('Illegal base64url string!"');
  }

  return utf8.decode(base64Url.decode(output));
}