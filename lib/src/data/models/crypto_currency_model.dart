class CryptoCoin {
  CryptoCoin({
    required this.name,
    required this.priceInUsd,
  });

  final String name;
  final String priceInUsd;

  factory CryptoCoin.fromJson(Map<String, dynamic> json) {
    return CryptoCoin(
      name: json['name'],
      priceInUsd: json['priceInUsd'].toString(),
    );
  }
}
