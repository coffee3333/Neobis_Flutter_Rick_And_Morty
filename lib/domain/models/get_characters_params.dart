class GetCharactersParams {
  final int numberPage;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;

  GetCharactersParams({
    required this.numberPage,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
  });
}
