import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:mini_projet/models/loans.dart';

import 'db.dart';

class AddLoans extends StatefulWidget {
  const AddLoans({ Key? key }) : super(key: key);

  @override
  _AddLoansState createState() => _AddLoansState();
}
final box = GetStorage();
final idMInput = TextEditingController();
final idCInput = TextEditingController();
final datEmpInput = TextEditingController();
final datRetInput = TextEditingController();
class _AddLoansState extends State<AddLoans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add Loans"),
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
                controller: idMInput,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name Member',
                    hintText: 'Enter your Firstname'),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: idCInput,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Component Name',
                    hintText: 'Enter the name of component'),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller:datEmpInput,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Date emprunt',
                    hintText: 'Enter the date of emprunt'),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: datRetInput,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'date Return',
                    hintText: 'Enter the date of return'),
              ),
            ),
            Padding(
             padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child:  ElevatedButton(
                onPressed: () {
                      MyDatabase.db.newLoans(Loans.withoutId(int.parse(idMInput.text), int.parse(idCInput.text),DateFormat('yyyy-MM-dd').parse(datEmpInput.text), DateFormat('yyyy-MM-dd').parse(datRetInput.text)));
                },
                child: Text(
                  "Add",
                 style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                ),
              ),
              Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: FutureBuilder(
              future: MyDatabase.db.queryAllLoans(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Map<String, Object?>>?> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  reverse: false,
                  itemBuilder: (context, index) {
                    final item = {};
                   print("!!!!! "+snapshot.data![index].toString());
                   snapshot.data![index].forEach((key, value) { 
                    item[key]=value;
                   });
                  print("------ el item : "+item.toString());
                   Loans c = Loans.fromMap(Map.from(item));
                   
                  box.write("loan"+c.idMember.toString()+c.idComponent.toString()+c.DateEmp.toString(),c.toMapWithoutId());
                 
                    return GestureDetector (child: Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue)
                    ),
                    child: Row(children: [
                      Text(c.idMember.toString() ,style: TextStyle(color: Colors.black, fontSize: 20)),
                      Text(" - " ,style: TextStyle(color: Colors.black, fontSize: 20)),
                      Text(c.DateEmp.toString().substring(0,10) ,style: TextStyle(color: Colors.black, fontSize: 20)),
                      Text(" - " ,style: TextStyle(color: Colors.black, fontSize: 20)),
                     
                    
                    ],)
                    ),
                    onLongPress: () => {
                      Navigator.of(context).restorablePush(_dialogBuilder,arguments: {'"id"':'"'+c.idMember.toString()+'"'})
                    },
                    );
                  },
                );
              },
            ),
          ),
          ]
        ),
      ),
    );


    
  }
  static Route<Object?> _dialogBuilder(BuildContext context, Object? arguments) {
      //Family f = Family.fromMap(jsonDecode(arguments.toString())); 
      // EditNameInput.text = f.name;
      
  return DialogRoute<void>(
    context: context,
    builder: (BuildContext context) =>  AlertDialog(title: Text("Modify / Delete ?"),content: 
    Column(children: [
     Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              
             // controller: EditNameInput,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter the name'),
            ),
          ), 
      Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 0),
            child: ElevatedButton(
              onPressed: () {
                print("modify pressed");
               // MyDatabase.db.modifyFamily(f, EditNameInput.text);
              },
              child: Text(
                "Modify",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 0),
            child: ElevatedButton(
              onPressed: () async {
                print("delete pressed");
               //MyDatabase.db.deleteFamily(Family(EditNameInput.text));
              },
              child: Text(
                "Delete",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
    ],))
  );
}

}