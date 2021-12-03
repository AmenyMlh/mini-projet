import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mini_projet/auth/db.dart';
import 'package:mini_projet/models/family.dart';

class AddFamily extends StatefulWidget {
  const AddFamily({Key? key}) : super(key: key);

  @override
  AddFamilyState createState() => AddFamilyState();
}

final box = GetStorage();
final nameInput = TextEditingController();
class AddFamilyState extends State<AddFamily> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add Family"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                ),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: nameInput,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter the name'),
              ),
            ),
            Padding(
             padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child:  ElevatedButton(
                onPressed: () {
                      MyDatabase.db.newFamily(Family.NameOnly(nameInput.text));
                },
                child: Text(
                  "Add",
                 style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                ),
              ),
          ]
        ),
      ),
    );
  }
}