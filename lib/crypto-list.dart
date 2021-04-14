import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/crypto-data.dart';
import 'package:http/http.dart' as http;

class CryptoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CryptoListState();
}

class CryptoListState extends State<CryptoList> {
  List<CryptoData> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CC Tracker"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => _loadCrypto(),
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
            subtitle: Text(el.symbol),
            title: Text(el.name),
            leading: CircleAvatar(
              child: Text(el.rank.toString()),
            ),
            trailing: Text('\$${el.price.toStringAsFixed(2)}'),
          ),
        )
        .toList();
  }

  _loadCrypto() async {
    final response =
        await http.get(Uri.parse('https://api.coincap.io/v2/assets?limit=10'));
    if (response.statusCode == 200) {
      // print(response.body);
      var allData =
          (json.decode(response.body) as Map)['data'] as List<dynamic>;
      var cryptoDataList = List<CryptoData>();
      allData.forEach((el) {
        var record = CryptoData(
            name: el["name"],
            price: double.parse(el["priceUsd"]),
            rank: int.parse(el["rank"]),
            symbol: el["symbol"]);
        cryptoDataList.add(record);
      });
      setState(() {
        data = cryptoDataList;
      });
      print(data);
    }
  }
}
