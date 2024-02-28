import 'package:flutter/material.dart';
import 'package:pdp/src/data/datasource/remote/network_service_impl.dart';
import 'package:pdp/src/data/models/crypto_currency_model.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  List<CryptoCoin> _coinList = []; // Инициализация _coinList пустым списком
  final NetworkServiceImpl service = NetworkServiceImpl();
  final List<Map<String, dynamic>> mockCryptoData = [
    {'name': 'Bitcoin', 'price': 50000},
    {'name': 'Ethereum', 'price': 3500},
    {'name': 'Bnb', 'price': 500},
  ];
  final test = "Hello";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF262424),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1919),
        title: const Center(
          child: Text(
            "Benance",
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemCount: _coinList.length,
          itemBuilder: (context, index) {
            final cryptoIndex = index;
            final crypto = _coinList[cryptoIndex];
            return ListTile(
              title: Text(
                crypto.name,
                style: const TextStyle(
                  fontSize: 44,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                crypto.priceInUsd,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.red,
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _coinList = await service.getDataCurrency();
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
