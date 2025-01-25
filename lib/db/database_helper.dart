import 'dart:io';

import 'package:akti4_sharedprefs_plus_sqlite/models/shagird.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// Singleton [ Design Pattern ]
class DatabaseHelper {
  // create database
  // create table and define its columns and data types
  // database
  DatabaseHelper._privateConstructor(); // Name constructor to create instance of database
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // private
  static Database? _database;

  // getter for database

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS
    // to store database

    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}/akti.db'; // database name
    // SQlite

    // open/ create database at a given path
    var studentsDatabase = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );

    return studentsDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''Create TABLE tbl_shagird (
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  name TEXT NOT NULL,
                  course TEXT,
                  mobile TEXT,
                  totalFee INTEGER,
                  feePaid INTEGER
                   );
        ''');

    // await db.execute('''Create TABLE tbl_ustaad (
    //               id INTEGER PRIMARY KEY AUTOINCREMENT,
    //               name TEXT NOT NULL,
    //               course TEXT,
    //               mobile TEXT,
    //               salary INTEGER,
    //                );
    //     ''');
  }

  // CRUD
  // Create, Read, Update and Delete
  // Save Student Record

  Future<int> addStudent(Shagird s) async {
    // get a reference to the database
    Database database = await instance.database;
    // logic

    int result = await database.rawInsert('''
    INSERT INTO tbl_shagird (name, course, mobile, totalFee, feePaid)
    VALUES ('${s.name}', '${s.course}', '${s.mobile}', ${s.totalFee}, ${s.feePaid});
    ''');

    return result;
  }

// Retrieve Students Records

// Delete Student Record

// Update Student Record
}
