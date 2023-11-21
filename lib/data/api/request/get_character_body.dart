class GetCharacterBody {
  final int numberPage;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;

  GetCharacterBody({
    required this.numberPage,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
  });

  Map<String, dynamic> toApi() {
    return {
      'page': numberPage,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
    };
  }
}
