//Utilisée pour définir les cas d'utilisation (use case) de l'app.


//Type : Le résultat attendu du cas d'utilisation (peut être null) || Params : Les paramètres n'essairent à l'execution du use case. (peux être null)
abstract class UseCase<Type, Params> {
  Future<Type> call({Params params});
  //call : méthod abstraite sans implémentation. prend en paramètre un params de type Params (peut être null) et renvoie une Future.
}

