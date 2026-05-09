import 'package:dio/dio.dart';

import '../../core/network/dio_client.dart';
import '../models/product_model.dart';

class ProductRepository {

  final DioClient dioClient;

  ProductRepository(this.dioClient);

  Future<List<ProductModel>> getProducts() async {

    Response response = await dioClient.dio.get('/products');

    List data = response.data;

    return data.map((e) {

      String title = e['title'];

      // NIM kamu genap = Promo Ongkir
      title += ' [Promo Ongkir]';

      return ProductModel(
        id: e['id'],
        title: title,
        price: (e['price'] as num).toDouble(),
        image: e['image'],
      );

    }).toList();
  }
}