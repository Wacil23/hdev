class ContractHistoryModel {
  final String numOperation;
  final String numTenant;
  final String numContract;
  final String dateOperation;
  final String operationDate;
  final String operationLabel;
  final bool hasDetail;
  final double amount;
  final String? trait;
  final int ctass;

  ContractHistoryModel(
      {required this.numOperation,
      required this.numTenant,
      required this.numContract,
      required this.operationLabel,
      required this.amount,
      required this.hasDetail,
      required this.operationDate,
      required this.dateOperation,
      required this.ctass,
      this.trait});

  factory ContractHistoryModel.fromMap(Map<String, dynamic> map) {
    return ContractHistoryModel(
        numOperation: map["NumOperation"],
        numTenant: map["NumLocataire"],
        numContract: map["NumContrat"],
        dateOperation: map["DateOperation"],
        operationLabel: map["LibelleOperation"],
        amount: map["Montant"],
        hasDetail: map["HasDetail"],
        operationDate: map["OperationDate"],
        trait: map["Trait"],
        ctass: map["Ctass"]);
  }
}
