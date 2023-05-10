class CategorieModel {
  late int? id_categorie;
  late String? titre_categorie;
  late String? description_categorie;
  late String? sexe;
  late String? img_categorie;
  late int? collaborateur;

  CategorieModel(
      {required this.id_categorie,
      required this.description_categorie,
      required this.sexe,
      required this.img_categorie,
      required this.collaborateur,
      required this.titre_categorie});

  factory CategorieModel.fromJsonMap(Map<String, dynamic> json) {
    return CategorieModel(
        id_categorie: json['id_categorie'],
        description_categorie: json['description_categorie'],
        sexe: json['sexe'],
        img_categorie: json['img_categorie'],
        collaborateur: json['collaborateur'],
        titre_categorie: json['titre_categorie']);
  }
}
