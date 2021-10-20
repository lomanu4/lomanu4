class Modulprimogrado {
  int? id;
  String? namefilm;
  String? descriptionfilm;
  String? yearsfilm;
  String? regiafilm;
  String? urlfilm;
  String? urlimage;

  Modulprimogrado(
      {this.id,
      this.namefilm,
      this.descriptionfilm,
      this.yearsfilm,
      this.regiafilm,
      this.urlfilm,
      this.urlimage});
  Modulprimogrado.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namefilm = json['namefilm'];
    descriptionfilm = json['descriptionfilm'];
    yearsfilm = json['yearsfilm'];
    regiafilm = json['regiafilm'];
    urlfilm = json['urlvideo'];
    urlimage = json['urlimage'];
  }
}
