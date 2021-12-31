import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mini_projet/Components/AddComponent.dart';
import 'package:mini_projet/Components/AddFamily.dart';
import 'package:mini_projet/Components/AddLoans.dart';
import 'package:mini_projet/Components/AddMember.dart';
import 'package:mini_projet/Components/showLoanedComps.dart';

import 'Components/LoginPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final box = GetStorage();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Welcome: "+box.read("user").toString(),style:TextStyle(color: Colors.black, fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/logo.jpg')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => AddFamily()));

                 },
                child: Text('Manage Families'),
              ),
            ),
           Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) =>AddComponent()));

                 },
                child: Text('Manage Components'),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => AddMember()));

                 },
                child: Text('Manage Members'),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                onPressed: () { 
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddLoans()));
                 },
                child: Text('Manage Loans'),
              ),
            ),
            
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                onPressed: () { 
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ShowLoanedComps()));
                 },
                child: Text('Show Loaned Components'),
              ),
            ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                onPressed: () { 
                      Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (Route<dynamic> route) => false

                    );
                    
                  },
                 
                child: Text('Log Out'),
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