class DetailsModel {
  final String id;
  final String name;
  final String symbol;
  final String description;
  final String image;
  final int market_cap_rank;
  final double percentChange_24h;
  final double percentChange_7d;
  final double percentChange_14;
  final double percentChange_30;
  final double percentChange_60;
  final double percentChange_200;
  final double percentChange_1y;
  final dynamic currentPrice;

  DetailsModel(
      {required this.id,
        required this.name,
        required this.symbol,
        required this.description,
        required this.image,
        required this.market_cap_rank,
        required this.currentPrice,
        required this.percentChange_24h,
        required this.percentChange_7d,
        required this.percentChange_14,
        required this.percentChange_30,
        required this.percentChange_60,
        required this.percentChange_200,
        required this.percentChange_1y});
  factory DetailsModel.fromJson(Map<String,dynamic> json){
    return DetailsModel(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        description: json["description"]["en"],
        image: json["image"]["large"],
        market_cap_rank: json["market_cap_rank"],
        currentPrice: json["market_data"]["current_price"]['usd'],
        percentChange_24h: json["market_data"]["price_change_percentage_24h"],
        percentChange_7d: json["market_data"]["price_change_percentage_7d"],
        percentChange_14: json["market_data"]["price_change_percentage_14d"],
        percentChange_30: json["market_data"]["price_change_percentage_30d"],
        percentChange_60: json["market_data"]["price_change_percentage_60d"],
        percentChange_200: json["market_data"]["price_change_percentage_200d"],
        percentChange_1y: json["market_data"]["price_change_percentage_1y"]);
  }
}
