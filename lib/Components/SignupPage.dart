// ignore: file_names
// ignore: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mini_projet/Components/LoginPage.dart';
import 'package:mini_projet/models/admin.dart';

import '../homepage.dart';
import 'db.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}
final box = GetStorage();
final emailInput = TextEditingController();
final passwordInput = TextEditingController();
final passwordConfirmInput = TextEditingController();

initView(){
   emailInput.text = "";
    passwordInput.text ="";
}

 
   
 

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Signup Page"),
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
                    
                    child: Image.asset('assets/images/logo.jpg')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailInput,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter your Email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordInput,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your Password'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordConfirmInput,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    hintText: 'Re-type your Password'),
              ),
            ),
            Padding(
             padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: ElevatedButton(
                onPressed: () {
                 if(passwordInput.text != passwordConfirmInput.text)
                  Navigator.of(context).restorablePush(_dialogBuilderFail);
                 else{
                   MyDatabase.db.newAdmin(Admin(emailInput.text.toString(),passwordInput.text.toString()));
                   Navigator.of(context).restorablePush(_dialogBuilderOK);
                 }
                
                },
                child: Text(
                  'Signup',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            Padding(
             padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: ElevatedButton(
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
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
  static Route<Object?> _dialogBuilderFail(BuildContext context, Object? arguments) {
  return DialogRoute<void>(
    context: context,
    builder: (BuildContext context) => const AlertDialog(title: Text("Error"),content: Text("Check your credentials")),
  );
}
 static Route<Object?> _dialogBuilderOK(BuildContext context, Object? arguments) {
  return DialogRoute<void>(
    context: context,
    builder: (BuildContext context) => const AlertDialog(title: Text("Success"),content: Text("Welcome! Head to login")),
  );
}
}