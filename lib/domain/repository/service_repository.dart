abstract class ServiceRepository {
  Future<Map<String, dynamic>> getCharacters({
    required int numberPage,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
  });

  Future<Map<String, dynamic>> getEpisodes({
    required List<int> episodes,
  });
}
