import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/Input.dart';
import '../widgets/bottomnavigationbar.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, Welcome Back!", style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height: 2),
            Text('Sign in to your account.', style: Theme.of(context).textTheme.bodySmall),
            SizedBox(height: 3),
            TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: inputDecorationStyle("Phone Number"),
            ),
            SizedBox(height: 2),
            TextField(
              obscureText: true,
              keyboardType: TextInputType.number,
              decoration: inputDecorationStyle("Enter Pin Number"),
            ),
            TextButton(onPressed: (){}, child: const Text("Forgot pin?", style: TextStyle(color: Colors.white, fontFamily: 'Hind', fontWeight: FontWeight.w500))),
            SizedBox(height: 2),
            SizedBox(
              width: 100,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Bottom()));
                },
                child: const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }

}