class ApiResult {
  Data? data;

  ApiResult({this.data});

  ApiResult.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  CoinDetails? bTC;

  Data({this.bTC});

  Data.fromJson(Map<String, dynamic> json) {
    bTC = json['BTC'] != null ? CoinDetails.fromJson(json['BTC']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bTC != null) {
      data['BTC'] = bTC!.toJson();
    }
    return data;
  }
}

class CoinDetails {
  late int id;
  late String name;
  late String symbol;
  late String slug;

  late String lastUpdated;
  late Quote quote;

  CoinDetails(
      {required this.id,
      required this.name,
      required this.symbol,
      required this.slug,
      required this.lastUpdated,
      required this.quote});

  CoinDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];

    lastUpdated = json['last_updated'];
    quote = Quote.fromJson(json['quote']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;

    data['last_updated'] = lastUpdated;

    data['quote'] = quote.toJson();

    return data;
  }
}

class Quote {
  late CoinPriceAndVolume priceAndVolume;

  Quote({required this.priceAndVolume});

  Quote.fromJson(Map<String, dynamic> json) {
    priceAndVolume = CoinPriceAndVolume.fromJson(json['USD']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['USD'] = priceAndVolume.toJson();

    return data;
  }
}

class CoinPriceAndVolume {
  late double price;
  late double volume24h;
  late double volumeChange24h;
  late double percentChange1h;
  late double percentChange24h;
  late double percentChange7d;
  late double percentChange30d;
  late double percentChange60d;
  late double percentChange90d;
  late double marketCap;
  late double marketCapDominance;
  late double fullyDilutedMarketCap;
  late String lastUpdated;

  CoinPriceAndVolume(
      {required this.price,
      required this.volume24h,
      required this.volumeChange24h,
      required this.percentChange1h,
      required this.percentChange24h,
      required this.percentChange7d,
      required this.percentChange30d,
      required this.percentChange60d,
      required this.percentChange90d,
      required this.marketCap,
      required this.marketCapDominance,
      required this.fullyDilutedMarketCap,
      required this.lastUpdated});

  CoinPriceAndVolume.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    volume24h = json['volume_24h'];
    volumeChange24h = json['volume_change_24h'];
    percentChange1h = json['percent_change_1h'];
    percentChange24h = json['percent_change_24h'];
    percentChange7d = json['percent_change_7d'];
    percentChange30d = json['percent_change_30d'];
    percentChange60d = json['percent_change_60d'];
    percentChange90d = json['percent_change_90d'];
    marketCap = json['market_cap'];
    marketCapDominance = json['market_cap_dominance'];
    fullyDilutedMarketCap = json['fully_diluted_market_cap'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['volume_24h'] = volume24h;
    data['volume_change_24h'] = volumeChange24h;
    data['percent_change_1h'] = percentChange1h;
    data['percent_change_24h'] = percentChange24h;
    data['percent_change_7d'] = percentChange7d;
    data['percent_change_30d'] = percentChange30d;
    data['percent_change_60d'] = percentChange60d;
    data['percent_change_90d'] = percentChange90d;
    data['market_cap'] = marketCap;
    data['market_cap_dominance'] = marketCapDominance;
    data['fully_diluted_market_cap'] = fullyDilutedMarketCap;
    data['last_updated'] = lastUpdated;
    return data;
  }
}
