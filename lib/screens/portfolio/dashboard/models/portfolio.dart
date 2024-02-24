class PortfolioModel {
  final String name;
  final String id;
  final String symbol;
  final String current_price;
  final String price_change_percentage_24h;
  final String image;

  const PortfolioModel(this.name, this.image, this.id, this.current_price,
      this.price_change_percentage_24h, this.symbol);

  PortfolioModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        symbol = json['symbol'] as String,
        id = json['id'] as String,
        current_price = json['current_price'].toString(),
        price_change_percentage_24h =
            json['price_change_percentage_24h'].toString(),
        image = json['image'] as String;

  Map<String, dynamic> toJson() => {
        'name': name,
        'symbol': symbol,
        'current_price': current_price,
        'image': image,
        'price_change_percentage_24h': price_change_percentage_24h,
      };
}
