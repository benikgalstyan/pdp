import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  final List<Map<String, dynamic>> mockCryptoData = [
    {'name': 'Bitcoin', 'price': 50000},
    {'name': 'Ethereum', 'price': 3500},
    {'name': 'Bnb', 'price': 500},
  ];

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
        child: ListView.builder(
          itemCount: mockCryptoData.length * 2 - 1,
          itemBuilder: (context, index) {
            if (index.isOdd) {
              return const Divider(color: Colors.grey);
            }
            final cryptoIndex = index ~/ 2;
            final crypto = mockCryptoData[cryptoIndex];
            return ListTile(
              title: Text(
                crypto['name'],
                style: const TextStyle(
                  fontSize: 44,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                '\$${crypto['price']}',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.red,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
