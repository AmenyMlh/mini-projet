import 'dart:developer';

import 'package:mini_projet/models/admin.dart';
import 'package:mini_projet/models/family.dart';
import 'package:mini_projet/models/member.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
  MyDatabase._();
  static final MyDatabase db = MyDatabase._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    // if _database is null we instantiate it
    _database = await initDB();
        return _database;
      }
    
    initDB() async {
    String path = join(getDatabasesPath().toString(), "flutter.db");
    return await openDatabase(path, version: 2, onOpen: (db) async{
      await db.execute("CREATE TABLE IF NOT EXISTS admin ("
          "username EMAIL PRIMARY KEY,"
          "password TEXT"
          ")");


      await db.execute("CREATE TABLE IF NOT EXISTS family("
      "id INTEGER PRIMARY KEY AUTOINCREMENT,"
      "name TEXT NOT NULL)"
      ); 


      await db.execute("CREATE TABLE IF NOT EXISTS member("
      "id INTEGER PRIMARY KEY AUTOINCREMENT,"
      "first_name TEXT NOT NULL,"
      "last_name TEXT NOT NULL,"
      "num1 INTEGER NOT NULL,"
      "num2 INTEGER)");
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE IF NOT EXISTS admin ("
          "username EMAIL PRIMARY KEY,"
          "password TEXT"
          ")");

      await db.execute('INSERT INTO admin values ("adminjs@gmail.com", "admin12345")');


      await db.execute("CREATE TABLE IF NOT EXISTS family("
      "id INTEGER PRIMARY KEY AUTOINCREMENT,"
      "name TEXT NOT NULL)"
      ); 


      await db.execute("CREATE TABLE IF NOT EXISTS member("
      "id INTEGER PRIMARY KEY AUTOINCREMENT,"
      "first_name TEXT NOT NULL,"
      "last_name TEXT NOT NULL,"
      "num1 INTEGER NOT NULL,"
      "num2 INTEGER)"); 
    });
    
  }
  newAdmin(Admin newAdmin) async {
    final db = await database;
    var res = await db?.insert("Admin", newAdmin.toMap());
    return res;
  }
   newFamily(Family newFamily) async {
    final db = await database;
    var res = await db?.insert("Family", newFamily.toMap());
    return res;
  }
  newMember(Member newMember) async {
    final db = await database;
    var res = await db?.insert("Member", newMember.toMap());
    return res;
  }

  Future<Admin> getAdmin(String username) async {
    final db = await database;
    var res = await  db?.query("Admin",where: "username = ?", whereArgs: [username]);
    print("--el get -"+res.toString());
    if (res!.isNotEmpty) {
      return Admin.fromMap(res.first);
    }
    else
    {
      return Admin("","");
    }
    
  }

  Future<Family> getFamily(String name) async {
    final db = await database;
    var res = await  db?.query("Family",where: "name = ?", whereArgs: [name]);
    print("--el get -"+res.toString());
    if (res!.isNotEmpty) {
      return Family.fromMap(res.first);
    }
    else
    {
      return Family.NameOnly("");
    }
    
  }
  Future<Member> getMember(String first_name) async {
    final db = await database;
    var res = await  db?.query("Member",where: "first_name = ?", whereArgs: [first_name]);
    print("--el get -"+res.toString());
    if (res!.isNotEmpty) {
      return Member.fromMap(res.first);
    }
    else
    {
      return Member.withoutId("","","","");
    }
    
  }

}
