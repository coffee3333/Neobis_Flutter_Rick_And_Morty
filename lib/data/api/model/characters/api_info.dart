class ApiInfo {
  final int quantity;
  final int pages;
  final int nextPage;
  final int prevPage;

  ApiInfo.fromApi(Map<String, dynamic> map)
      : quantity = map["info"]["count"],
        pages = map["info"]["pages"],
        nextPage = (map["info"]["next"].toString().length - 1).toInt(),
        prevPage = (map["info"]["next"].toString().length - 1).toInt();
}
