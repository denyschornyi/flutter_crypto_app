import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/crypto-list.dart';

void main() => runApp(CryptoTracker());

class CryptoTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CryptoList(),
    );
  }
}
