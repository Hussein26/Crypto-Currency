class SearchModel {
  final String id;
  final String name;
  final String symbol;
  final dynamic rank;
  final String image;

  SearchModel(
      {required this.id,
        required this.name,
        required this.symbol,
        required this.rank,
        required this.image});

  factory SearchModel.formJson(Map<String, dynamic> json) {
    return SearchModel(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        rank: json["market_cap_rank"],
        image: json["large"]);
  }
}
