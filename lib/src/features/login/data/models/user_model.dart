import 'package:hdev/src/features/login/data/models/token_model.dart';

class UserModel {
  final int idTenant;
  final String numTenant;
  final String email;
  final String idAccount;
  final String completeName;
  final TokenModel token;
  final dynamic contract;
  final dynamic phone;

  UserModel(
      {required this.idTenant,
      required this.numTenant,
      required this.email,
      required this.idAccount,
      required this.completeName,
      required this.token,
      required this.contract,
      required this.phone});
}
