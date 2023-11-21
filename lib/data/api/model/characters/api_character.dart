class ApiCharacter {
  final int id;
  final String status;
  final String name;
  final String species;
  final String gender;
  final String originName;
  final String locationName;
  final String image;
  final List<int> episodes;

  ApiCharacter.fromApi(Map<String, dynamic> map)
      : id = map["id"],
        status = map["status"],
        name = map["name"],
        species = map["species"],
        gender = map["gender"],
        originName = map["origin"]['name'],
        locationName = map["location"]['name'],
        image = map["image"],
        episodes = _getPages(map["episode"]);

  static List<int> _getPages(List<dynamic> links) {
    List<int> answers = [];
    for (var link in links) {
      answers.add(_getValueFromLink(link));
    }
    return answers;
  }

  static int _getValueFromLink(String link) {
    List<String> splitedLink = link.split("/");
    return int.parse(splitedLink.last);
  }
}
