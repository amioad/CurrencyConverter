import 'dart:io';
import 'package:currency_converter/models/currencyModel.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database!;

    // If database don't exists, create one
    _database = await initDB();

    return _database!;
  }

  // Create the database and the Currencies table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'CurrencyConverter.db');

    return await openDatabase(path, version: 5, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Currencies (id INTEGER PRIMARY KEY, conversion_rates TEXT)');
    });
  }

  // Insert currency on database
  Future<int> insertCurrency(CurrencyModel newCurrency) async {
    await deleteAllCurrency();
    final db = await database;
    final res = await db.insert(
      'Currencies',
      newCurrency.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    db.query("Currencies");
    return res;
  }

  Future<List<CurrencyModel>> getAllCurrencies() async {
    final db = await database;
    var res = await db.query('Currencies', orderBy: 'id');

    List<CurrencyModel> list = res.isNotEmpty
        ? res.map((c) {
            return CurrencyModel(conversionRates: c);
          }).toList()
        : [];
    return list;
  }

  // Delete all Currencies
  Future<int> deleteAllCurrency() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Currencies');

    return res;
  }
}
