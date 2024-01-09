import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managment/Screens/registration.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/Input.dart';
import '../widgets/bottomnavigationbar.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController pass = TextEditingController();

  late Box box1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createbox();
  }


  void createbox() async {
    box1 = await Hive.openBox('logindata');

  }

  Future<void> saveLastLoginTimestamp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('lastLoginTimestamp', DateTime.now().toUtc().millisecondsSinceEpoch);
  }

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
            Text("Hi, Welcome Back!", style: Theme
                .of(context)
                .textTheme
                .headlineLarge),
            SizedBox(height: 20),
            Text('Sign in to your account.', style: Theme
                .of(context)
                .textTheme
                .bodySmall),
            SizedBox(height: 20.h.w),
            TextField(
              controller: email,
              decoration: inputDecorationStyle("Email"),
            ),
            SizedBox(height: 20.h.w),
            TextField(
              controller: pass,
              obscureText: true,
              decoration: inputDecorationStyle("password"),
            ),
            SizedBox(height: 40.h.w),
            SizedBox(
              width: 500.h.w,
              height: 40.h.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent),
                onPressed: () async{
                  try {
                    if (box1.get('email') == email.text && box1.get('pass') == pass.text) {
                      await saveLastLoginTimestamp();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Bottom()));
                    } else {
                      VxToast.show(
                        context,
                        msg: 'Incorrect details',
                        position: VxToastPosition.top,
                        bgColor: Colors.blue,
                        textColor: Colors.white,
                      );
                    }
                  } catch (e) {
                    print('Error: $e');
                    // Handle the error gracefully
                  }


                },
                child: const Text("Login"),
              ),
            ),
            Row(
              children: [
                Text("Don't Have an account?"),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => registrationpage()));
                },
                    child: const Text("Signup", style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Hind',
                        fontWeight: FontWeight.w500))),
              ],
            )
          ],
        ),
      ),
    );
  }
}