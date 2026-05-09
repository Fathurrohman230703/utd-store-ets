import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/models/bookmark_product.dart';

class IsarService {

  late Future<Isar> db;

  IsarService() {
    db = openIsar();
  }

  Future<Isar> openIsar() async {

    final dir = await getApplicationDocumentsDirectory();

    return await Isar.open(
      [BookmarkProductSchema],
      directory: dir.path,
    );
  }
}