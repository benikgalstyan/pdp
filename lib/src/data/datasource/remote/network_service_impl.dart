import 'dart:convert';

import 'package:pdp/src/data/models/crypto_currency_model.dart';
import 'package:pdp/src/data/datasource/remote/network_service.dart';
import 'package:http/http.dart' as http;

class NetworkServiceImpl extends NetworkService {
  @override
  Future<List<CryptoCoin>> getDataCurrency() async {
    final url = Uri.parse(
      "https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,ADA,ADX&tsyms=USD,EUR",
    );
    final response = await http.get(url);

    final responseData = jsonDecode(response.body);

    final List<CryptoCoin> cryptoList = [];
    responseData.forEach((key, value) {
      final CryptoCoin crypto = CryptoCoin.fromJson({
        'name': key,
        'priceInUsd': value['USD'],
      });
      cryptoList.add(crypto);
    });

    return cryptoList;
  }
}
