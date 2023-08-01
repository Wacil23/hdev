

import '../jwt/decode_token.dart';

class TokenModel {
  final String tokenValue;
  final dynamic tokenPayload;

  TokenModel({
    required this.tokenValue,
    required this.tokenPayload,
  });

  factory TokenModel.fromJwt(String token) {
    final decodedToken = parseJwtPayLoad(token);
    return TokenModel(
      tokenValue: token,
      tokenPayload: decodedToken.payload,
    );
  }
}
