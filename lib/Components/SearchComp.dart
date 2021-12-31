import 'package:flutter/material.dart';
import 'package:mini_projet/Components/db.dart';
import 'package:mini_projet/models/component.dart';

class SearchComp extends StatefulWidget {


  @override
  _SearchCompState createState() => _SearchCompState();
}

class _SearchCompState extends State<SearchComp> {
  
  TextEditingController teSeach = TextEditingController();
 List<Map<String, Object?>>? allComponents = [];
 List<Map<String, Object?>>? items = [];

 @override
  void initState() {
    super.initState();
   
    MyDatabase.db.queryAllComponent().then((components){
      setState(() {
        allComponents = components;
        items = allComponents;
      });
    
  });
  }

  void filterSeach(String query) async{
   var dummySearchList = allComponents;
   if(query.isNotEmpty){
     List<Map<String, Object?>>? dummyListData = [];
     dummySearchList!.forEach((item){
       var component = Component.fromMap(item);
       if(component.name.toString().toLowerCase().contains(query.toLowerCase())){
         dummyListData.add(item);
       }
     });
     setState(() {
      items = [];
      items!.addAll(dummyListData);
     });
     return;
   }else{
    setState(() {
      items = [];
      items = allComponents;
    });
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Component'),
        actions: <Widget>[
         
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              onChanged: (value){
                setState(() {
                  filterSeach(value);
                });
              },
              controller: teSeach,
              decoration: InputDecoration(
                hintText: 'Search...',
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                )
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: items!.length,
                itemBuilder: (context, i){
                  Component component = Component.fromMap(items![i]);
                  return Card(
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text('Name: ${component.name.toString()} '),
                      subtitle: Text("Quantity: "+component.quantity.toString()),
                      onTap: (){
                        
                      },
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
 }

