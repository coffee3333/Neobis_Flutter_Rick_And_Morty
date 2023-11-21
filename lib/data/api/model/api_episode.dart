class ApiEpisode {
  final int id;
  final String name;
  final String date;
  final String episode;

  ApiEpisode.fromApi(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        date = map["air_date"],
        episode = map["episode"];
}
