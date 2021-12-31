import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mini_projet/Components/AddComponent.dart';
import 'package:mini_projet/Components/AddFamily.dart';
import 'package:mini_projet/Components/AddLoans.dart';
import 'package:mini_projet/Components/AddMember.dart';

import 'package:mini_projet/Components/db.dart';
import 'package:mini_projet/models/loans.dart';

class ShowLoanedComps extends StatefulWidget {
  @override
  _ShowLoanedCompsState createState() => _ShowLoanedCompsState();
}

class _ShowLoanedCompsState extends State<ShowLoanedComps> {

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Show Loaned Components"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: FutureBuilder(
              future: MyDatabase.db.queryAllNotReturnedLoans(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Map<String, String>>?> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  reverse: false,
                  itemBuilder: (context, index) {
                    var item = {};
                   snapshot.data![index].forEach((key, value) { 
                    item[key]=value;
                   });
                   
                                     
                    if (item['compName'] == Null){
                      print('&&&&&- '+item['compName'].toString());
                      return GestureDetector (child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue)
                    ),
                    child: Row(children: [
                      Flexible(child: Text(item['compName'].toString()+" - " ,style: TextStyle(color: Colors.black, fontSize: 20))),
                      Flexible(child: Text(item['memberName'].toString()+" - " ,style: TextStyle(color: Colors.black, fontSize: 20))),
                      Flexible(child: Text(item['memberPhone'].toString() ,style: TextStyle(color: Colors.black, fontSize: 15))),
                      
                    
                    ],)
                    ),
                    onLongPress: () async=> {
                    
                    },
                    );
                    }
                    else {
                      return GestureDetector (child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue)
                    ),
                    child: Text(item['msg'].toString(),style: TextStyle(color: Colors.black, fontSize: 25))
                    ),
                    onLongPress: () async=> {
                    
                    },
                    );
                    }
                  },
                );
              },
            ),
          ),
            
            SizedBox(
              height: 130,
            ),
            
          ],
        ),
      ),
    );
  }
}