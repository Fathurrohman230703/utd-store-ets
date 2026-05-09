// real time harga bitcoin

import 'dart:async';
import 'dart:math';

class CryptoService {

  Stream<String> getBitcoinPrice() async* {

    double price = 108000;

    while (true) {

      await Future.delayed(
        const Duration(seconds: 1),
      );

      price += Random().nextDouble() * 1000 - 500;

      yield price.toStringAsFixed(2);
    }
  }
}