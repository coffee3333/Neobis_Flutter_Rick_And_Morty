class ApiCharacter {
  final int id;
  final String status;
  final String name;
  final String species;
  final String gender;
  final String originName;
  final String locationName;
  final String image;
  final List<dynamic> episodes;

  ApiCharacter.fromApi(Map<String, dynamic> map)
      : id = map["id"],
        status = map["status"],
        name = map["name"],
        species = map["species"],
        gender = map["gender"],
        originName = map["origin"]['name'],
        locationName = map["location"]['name'],
        image = map["image"],
        episodes = map["episode"];
}
