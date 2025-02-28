/// Defines a Character object

class Character {
  int id;
  String name;
  String height;
  String mass;
  String hair;
  String skin;
  String eye;
  String year;
  String gender;
  String planet;
  String species;
  int fav;

  Character({this.id, this.name, this.height, this.mass, this.hair, this.skin,
      this.eye, this.year, this.gender, this.planet, this.species, this.fav});


  /// Returns a new character from a database response.
  factory Character.fromMap(Map<String, dynamic> json) => new Character(
    id: json["id"],
    name: json["name"],
    height: json["height"].toString(),
    mass: json["mass"].toString(),
    hair: json["hair"],
    skin: json["skin"],
    eye: json["eye"],
    year: json["year"],
    gender: json["gender"],
    planet: json["planet"],
    species: json["species"],
    fav: json["fav"]);

  /// Returns a new character from a Json, used to create a character using the
  /// response from SWAPI.
  factory Character.fromJson(Map<String, dynamic> json, int id, String planet,
      String species, int favo) => new Character(
      id: id,
      name: json["name"],
      height: json["height"],
      mass: json["mass"],
      hair: json["hair_color"],
      skin: json["skin_color"],
      eye: json["eye_color"],
      year: json["birth_year"],
      gender: json["gender"],
      planet: planet,
      species: species,
      fav: favo);


  /// Returns a Map from the character to store in the database.
  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "height": height,
    "mass": mass,
    "hair": hair,
    "skin": skin,
    "eye": eye,
    "year": year,
    "gender": gender,
    "planet": planet,
    "species": species,
    "fav": fav
  };

  /// Compares if two character objects share the same attributes
  /// (not the same object, but the same characters)
  bool isEqual(Character char){

    if(this.name == char.name &&
       this.height == char.height &&
       this.mass == char.mass &&
       this.hair == char.hair &&
       this.skin == char.skin &&
       this.eye == char.eye &&
       this.year == char.year &&
       this.gender == char.gender &&
       this.planet == char.planet &&
       this.species == char.species){
      return true;
    }
    return false;
  }

}