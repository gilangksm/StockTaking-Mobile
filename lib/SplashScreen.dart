import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stoktaking_app/View/Login/login_screen.dart';

class SplashScreen extends StatefulWidget{

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => LoginScreen()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,

              colors: [Color(0xFFFFFFFF),Color(0xFFFFFFFF),]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SizedBox(height: 60,),
                Text("PANASONIC",textAlign:TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Arial-Black',
                    color: Colors.blueAccent,
                    fontSize: 18.0,
                  ),
                ),
                Image.asset(
                  "assets/images/ilustrasi.png",
                  height: 400.0,
                  width: 400.0,
                ),
              ],
            ),

            //*Animasi loading
            CircularProgressIndicator(
              strokeWidth: 10,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
            ),

            // FlatButton(
            //   focusColor: Colors.red,
            //   hoverColor: Colors.green,
            //   splashColor: Colors.blue,
            //   onPressed: () { },
            //   child: Text('FlatButton with custom overlay colors'),
            // )
            // Container(
            //   width: 300,
            //   height: 45,
            //   child: TextButton(
            //     style: TextButton.styleFrom(
            //         backgroundColor: Color(0xffF18265),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(20),
            //         ),
            //      ),
            //     onPressed: () {},
            //     child: Text(
            //       "Login",
            //       style: TextStyle(
            //         color: Color(0xffffffff),
            //       ),
            //     ),
            //   ),
            // ),

            // Padding(
            //   padding: const EdgeInsets.only(left: 20, right: 20),
            //   child: MaterialButton(
            //     color: Colors.teal[100],
            //     elevation: 10,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         Container(
            //           height: 30.0,
            //           width: 30.0,
            //           decoration: BoxDecoration(
            //             image: DecorationImage(
            //                 image:
            //                 AssetImage('assets/images/googleimage.png'),
            //                 fit: BoxFit.cover),
            //             shape: BoxShape.circle,
            //           ),
            //         ),
            //         SizedBox(
            //           width: 20,
            //         ),
            //         Text("Sign In with Google")
            //       ],
            //     ),
            //     onPressed: (){},
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}