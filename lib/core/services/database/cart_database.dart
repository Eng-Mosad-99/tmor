import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tmor/constants.dart';
import '../../../models/cart_product_model.dart';

class DataBaseHelper {
  DataBaseHelper._();
  static final DataBaseHelper dataBaseHelper = DataBaseHelper._();

  // ignore: unused_field
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'CartProducts.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
  CREATE TABLE $cartProductTable (
    $columnName TEXT NOT NULL,
    $columnImage TEXT NOT NULL,
    $columnPrice TEXT NOT NULL,
    $columnProductId TEXT NOT NULL,
    $columnQuantity INTEGER NOT NULL,
  )
''');
      },
    );
  }

  getCartProducts() async {
    var dbClient = await database;
    List<Map<String, dynamic>> maps =
        await dbClient?.query(cartProductTable) ?? [];
    return maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];
  }
}
