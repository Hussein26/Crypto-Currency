class HomeModel{
  final String id;
  final String name;
  final String symbol;
  final String imageUrl;
  final dynamic currentPrice;
  final double priceChange;
  final double priceChangePercentage;
  final int marketCapRank;
  HomeModel(
      { required this.id,
        required this.name,
        required this.symbol,
        required this.imageUrl,
        required this.currentPrice,
        required this.priceChange,
        required this.priceChangePercentage,
        required this.marketCapRank});
  factory HomeModel.fromJson(Map<String,dynamic> json){
    return HomeModel(id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        imageUrl: json["image"],
        currentPrice: json["current_price"],
        priceChange: json["price_change_24h"],
        priceChangePercentage: json["price_change_percentage_24h"],
        marketCapRank: json["market_cap_rank"]);
  }
}