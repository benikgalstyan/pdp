import 'package:pdp/src/data/models/crypto_currency_model.dart';

abstract class NetworkService {
  Future<List<CryptoCoin>> getDataCurrency();
}
