// ignore_for_file: non_constant_identifier_names

class RdvModel {
  late int? id_rdv;
  late String? titre;
  late String? montant;
  late String? date_debut;
  late String? date_fin;
  late String? date_create;
  late String? nomuser;
  late String? prenomuser;
  late String? telephoneuser;

  RdvModel(
      {required this.id_rdv,
      required this.titre,
      required this.date_create,
      required this.telephoneuser,
      required this.date_debut,
      required this.date_fin,
      required this.nomuser,
      required this.prenomuser,
      required this.montant});

  factory RdvModel.fromJson(Map<String, dynamic> json) {
    return RdvModel(
      date_create: json["date_create"],
      date_debut: json["date_debut"],
      date_fin: json["date_fin"],
      id_rdv: json["id_rdv"],
      montant: json["montant"],
      telephoneuser: json["telephoneuser"],
      titre: json["titre"],
      nomuser:  json["nomuser"],
      prenomuser: json["prenomuser"],
    );
  }
}
