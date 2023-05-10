class HoraireModel {
  late int? id_horaire;
  late String? debut;
  late String? fin;
  late String? sexe;

  HoraireModel(
      {required this.id_horaire,
      required this.fin,
      required this.sexe,
      required this.debut});

  factory HoraireModel.fromJsonMap(Map<String, dynamic> json) {
    return HoraireModel(
        id_horaire: json['id_horaire'],
        fin: json['fin'],
        sexe: json['sexe'],
        debut: json['debut']);
  }

  static fromJson(json) {}
}
