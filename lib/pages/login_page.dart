import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final String email;
  late final String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
          child: Column(children: [
            TextField(
              decoration: InputDecoration(
                hintText: "enter your email",
              ),
              onChanged: (value){
                setState(() {
                  this.email = value;
                });
              },
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                hintText: "enter your password",
              ),
              onChanged: (value){
                setState(() {
                  this.password = value;
                });
              },
            ),
            SizedBox(height: 10,),
            TextButton(
                onPressed: (){

                },
                child: Text('Login'),
            ),
            SizedBox(height: 10,),
            TextButton(
              onPressed: (){

              },
              child: Text('Signup'),
            )
          ],),
      )
    );
  }
}
