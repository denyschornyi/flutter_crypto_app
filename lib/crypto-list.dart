import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/crypto-data.dart';

class CryptoList extends StatelessWidget {
  List<CryptoData> data = [
    CryptoData(name: 'Bitcoin', symbol: 'BTC', price: 63450, rank: 1),
    CryptoData(name: 'Dogecoin', symbol: 'DOGE', price: 0.19, rank: 4),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CC Tracker"),
      ),
      body: Container(
        child: ListView(
          children: _buildList(),
        ),
      ),
    );
  }

  List<Widget> _buildList() {
    return data
        .map(
          (CryptoData el) => ListTile(
            title: Text(el.symbol),
            subtitle: Text(el.name),
            leading: CircleAvatar(
              child: Text(el.rank.toString()),
            ),
            trailing: Text('\$${el.price.toStringAsFixed(2)}'),
          ),
        )
        .toList();
  }
}
