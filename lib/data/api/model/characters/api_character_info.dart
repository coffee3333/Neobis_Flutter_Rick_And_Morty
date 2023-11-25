class ApiCharacterInfo {
  final int quantity;
  final int pages;
  final String nextPage;
  final String prevPage;

  ApiCharacterInfo.fromApi(Map<String, dynamic> map)
      : quantity = map["info"]["count"],
        pages = map["info"]["pages"],
        nextPage = map["info"]["next"] ?? "",
        prevPage = map["info"]["prev"] ?? "";
}
