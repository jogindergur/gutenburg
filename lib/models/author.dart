class Author {
  String? name;
  int? birthYear;
  int? deathYear;

  Author({this.name, this.birthYear, this.deathYear});

  Author.fromJSON(Map<String, dynamic> data) {
    name = data['name'];
    birthYear = data['birth_year'];
    deathYear = data['death_year'];
  }
}
