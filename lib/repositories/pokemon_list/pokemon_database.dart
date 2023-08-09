import 'package:pokemon_application/repositories/pokemon_list/models/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'models/pokemon_list_model.dart';

class PokemonDatabase {
  static Future<Database> initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'pokemon_database.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE pokemon_table(
            id INTEGER PRIMARY KEY,
            name TEXT,
            url TEXT
          )
          ''',
        );
      },
    );
  }

  static Future<void> savePokemonList(List<PokemonList> pokemonList) async {
    final database = await initDatabase();
    for (final pokemon in pokemonList) {
      await database.insert(
        'pokemon_table',
        pokemon.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  static Future<List<PokemonList>> getPokemonListFromDatabase() async {
    final database = await initDatabase();
    final maps = await database.query('pokemon_table');

    return List.generate(maps.length, (i) {
      return PokemonList(
        name: maps[i]['name'] as String,
        url: maps[i]['url'] as String,
      );
    });
  }
}
