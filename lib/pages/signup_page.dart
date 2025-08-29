import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
  late final String email;
  late final String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Create an Account')),
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
