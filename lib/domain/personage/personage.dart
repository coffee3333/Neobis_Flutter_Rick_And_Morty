class Personage {
  final int id;
  final bool isAlive;
  final String name;
  final String race;
  final String sex;
  final String placeOfBirth;
  final String placeOfLiving;
  final String fotoUrl;

  Personage({
    required this.id,
    required this.isAlive,
    required this.name,
    required this.race,
    required this.sex,
    required this.placeOfBirth,
    required this.placeOfLiving,
    required this.fotoUrl,
  });

  Personage.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        isAlive = json['isAlive'] as bool,
        name = json['name'] as String,
        race = json['race'] as String,
        sex = json['sex'] as String,
        placeOfBirth = json['placeOfBirth'] as String,
        placeOfLiving = json['placeOfLiving'] as String,
        fotoUrl = json['fotoUrl'] as String;
}
