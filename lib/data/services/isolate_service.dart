// button kalkulasi

import 'package:flutter/foundation.dart';

int heavyCalculation(int totalLoop) {

  int total = 0;

  for (int i = 0; i < totalLoop; i++) {
    total += i;
  }

  return total;
}

class IsolateService {

  Future<int> startHeavyTask() async {

    return await compute(
      heavyCalculation,
      920000000,
    );
  }
}