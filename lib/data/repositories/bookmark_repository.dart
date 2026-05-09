import 'package:isar/isar.dart';

import '../../core/di/isar_service.dart';
import '../models/bookmark_product.dart';
import '../models/product_model.dart';

class BookmarkRepository {

  final IsarService isarService;

  BookmarkRepository(this.isarService);

  Future<void> saveBookmark(ProductModel product) async {

    final isar = await isarService.db;

    final bookmark = BookmarkProduct()
      ..title = product.title
      ..price = product.price
      ..image = product.image
      ..savedAt = DateTime.now();

    await isar.writeTxn(() async {
      await isar.bookmarkProducts.put(bookmark);
    });
  }

  Future<List<BookmarkProduct>> getBookmarks() async {

    final isar = await isarService.db;

    return await isar.bookmarkProducts.where().findAll();
  }

  Future<Isar> getDb() async {
    return await isarService.db;
  }
}