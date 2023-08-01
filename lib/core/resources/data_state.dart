//Gestion abstraite des états de données 

abstract class DataState<T> {
  final T? data; //La ou Les données qui résultent de la requête (T specifie type_générique)
  final T ? error; //La ou Les erreurs qui résultent de la requête
  const DataState({this.data, this.error});
}


//Represention du cas de la reussite d'un appel API
class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data); //Les données sont encapsulées dans le DataSuccess et renvoyées au DataState.
}

//Represention du cas de la reussite d'un appel API
class DataFailed<T> extends DataState<T> {
  const DataFailed(T error) : super(error: error);//Les erreurs sont encapsulées dans le DataFailed et renvoyées au DataState.
}
