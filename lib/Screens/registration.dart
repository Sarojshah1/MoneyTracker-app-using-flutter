import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';
import 'Login.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class registrationpage extends StatefulWidget {
  const registrationpage({Key? key}) : super(key: key);

  @override
  _registrationpageState createState() => _registrationpageState();
}

class _registrationpageState extends State<registrationpage> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();

  TextEditingController pass = TextEditingController();
  late Box box1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createbox();
  }
  void createbox()async{
    box1=await Hive.openBox('logindata');


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/backgroundUI.png"),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,40 , 20, 0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 100,
                          width: 100,
                          child: SvgPicture.asset("images/xing.svg")),
                      HeightBox(10),
                      "Registration".text.color(Colors.white).size(20).make(),
                      HeightBox(
                          40
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: TextField(
                          controller: name,
                          decoration: InputDecoration(
                            hintText: 'full Name',
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.white
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.blue
                                )
                            ),
                            isDense: true,                      // Added this
                            contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                          ),
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      HeightBox(
                          40
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: TextField(
controller: email,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.white
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.blue
                                )
                            ),
                            isDense: true,                      // Added this
                            contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                          ),
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      HeightBox(
                          40
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: TextField(
controller: pass,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.white
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.blue
                                )
                            ),
                            isDense: true,                      // Added this
                            contentPadding: EdgeInsets.fromLTRB(10.h, 20.h, 10, 10),
                          ),
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      HeightBox(40),
                      GestureDetector(
                          onTap:(){


Signup();
name.text='';
email.text='';
pass.text='';

                          },
                          child: "Sign-Up".text.white.bold.xl.makeCentered().box.white.shadowOutline(outlineColor: Colors.grey).color(Color(0XFFFF0772)).roundedLg.make().w(450).h(40)),
                      HeightBox(140),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
          },
          child: RichText(text: TextSpan(
            text: 'New User?',
            style: TextStyle(fontSize: 15.0, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: ' Login Now',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0XFF4321F5)),
              ),
            ],
          )
          ).pLTRB(20, 0, 0, 15),
        )
    );
  }
  void Signup(){
    box1.put('name', name.text);
    box1.put('email', email.text);
    box1.put('pass', pass.text);
  }

}