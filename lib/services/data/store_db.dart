import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'my_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    // PRODUCTS TABLE
    await db.execute('''
      CREATE TABLE products(
        product_id TEXT PRIMARY KEY,
        product_name TEXT,
        product_type TEXT,
        product_price TEXT
      )
    ''');

    // WISHLIST TABLE
    await db.execute('''
     CREATE TABLE wishlists (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  product_id TEXT NOT NULL UNIQUE,
  added_at DATETIME DEFAULT CURRENT_TIMESTAMP
)
    ''');

    // ORDERS TABLE
    await db.execute('''
      CREATE TABLE orders(
        order_id TEXT PRIMARY KEY,
        product_id TEXT,
        quantity INTEGER,
        user_id TEXT,
        credit INTEGER,
        address TEXT,
        gps_location TEXT
      )
    ''');
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
