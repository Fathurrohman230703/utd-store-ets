import 'package:isar/isar.dart';

part 'bookmark_product.g.dart';

@collection
class BookmarkProduct {

  Id id = Isar.autoIncrement;

  late String title;

  late double price;

  late String image;

  late DateTime savedAt;
}