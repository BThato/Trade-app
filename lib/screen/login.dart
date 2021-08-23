import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:trade/screen/dashBoard.dart';
import 'package:trade/screen/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trade/service/auth.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  var authHandler = new Auth();
  start() async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Login to your account",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      inputFile(label: "Email", userCon: _controllerEmail),
                      inputFile(
                          label: "Password",
                          obscureText: true,
                          userCon: _controllerPassword)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        )),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () async {
                        authHandler
                            .handleSignInEmail(
                                _controllerEmail.text, _controllerPassword.text)
                            .then((User user) {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new Dashboard()));
                        }).catchError((e) => print(e));
                        // await FirebaseAuth.instance.signInWithEmailAndPassword(
                        //     email: _controllerEmail.text,
                        //     password: _controllerPassword.text);
                        // setSate(() {});
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => Dashboard()));
                      },
                      color: Color(0xff0095FF),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                RichText(
                  text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Sign up',
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 18),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignupPage()));
                              })
                      ]),
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,

                //   children: <Widget>[

                //     Text("Don't have an account?"),
                //     Text(" Sign up", style: TextStyle (
                //       fontWeight: FontWeight.w600,
                //       fontSize: 18,

                //     ),

                //     )
                //   ],
                // ),

                Container(
                  padding: EdgeInsets.only(top: 100),
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/background.png"),
                        fit: BoxFit.fitHeight),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  void setSate(Null Function() param0) {}
}

// we will be creating a widget for text field
Widget inputFile({label, obscureText = false, userCon}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        controller: userCon,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
