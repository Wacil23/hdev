class ContractsModel {
  final String codeBailleur;
  final String numLocataire;
  final String nomLocataire;
  final String prenomLocataire;
  final String numContrat;
  final int typeBien;
  final String adresseBien;
  final String? complementAdresseBien;
  final String? autreAdresseBien;
  final String codePostalBien;
  final String villeBien;
  final double soldeContrat;
  final DateTime? dateSoldeContrat;
  final DateTime dateDebut;
  final DateTime? dateFin;
  final bool isActif;
  final int modePaiement;

  ContractsModel(
      {required this.codeBailleur,
      required this.numLocataire,
      required this.nomLocataire,
      required this.prenomLocataire,
      required this.numContrat,
      required this.typeBien,
      required this.adresseBien,
      required this.complementAdresseBien,
      required this.autreAdresseBien,
      required this.codePostalBien,
      required this.villeBien,
      required this.soldeContrat,
      required this.dateSoldeContrat,
      required this.dateDebut,
      required this.dateFin,
      required this.isActif,
      required this.modePaiement});

       factory ContractsModel.fromMap(Map<String, dynamic> map) {
    return ContractsModel(
      // Récupérez les valeurs de la map et initialisez votre modèle
      codeBailleur: map['CodeBailleur'],
      numLocataire: map['NumLocataire'],
      nomLocataire: map['NomLocataire'],
      prenomLocataire: map['PrenomLocataire'],
      numContrat: map['NumContrat'],
      typeBien: map['TypeBien'],
      adresseBien: map['AdresseBien'],
      complementAdresseBien: map['ComplementAdresseBien'],
      autreAdresseBien: map['AutreAdresseBien'],
      codePostalBien: map['CodePostalBien'],
      villeBien: map['VilleBien'],
      soldeContrat: map['SoldeContrat'],
      dateSoldeContrat: map['DateSoldeContrat'] != null
          ? DateTime.parse(map['DateSoldeContrat'])
          : null,
      dateDebut: DateTime.parse(map['DateDebut']),
      dateFin: map['DateFin'] != null ? DateTime.parse(map['DateFin']) : null,
      isActif: map['IsActif'],
      modePaiement: map['ModePaiement'],
    );
  }
}
