import 'package:flutter/material.dart';
import 'package:trade/service/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trade/screen/login.dart';

class SignupPage extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  var authHandler = new Auth();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  start() async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        height: MediaQuery.of(context).size.height - 50,
        width: double.infinity,
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create an account, It's free ",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  inputFile(label: "Username", userCon: _controllerUsername),
                  inputFile(label: "Email", userCon: _controllerEmail),
                  inputFile(
                      label: "Password",
                      obscureText: true,
                      userCon: _controllerPassword),
                  inputFile(label: "Confirm Password ", obscureText: true),
                ],
              ),
              Container(
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
                  onPressed: () {
                    authHandler
                        .handleSignUp(
                            _controllerEmail.text, _controllerPassword.text)
                        .then((User user) {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new LoginPage()));
                    }).catchError((e) => print(e));
                    // await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    //     email: _controllerEmail.text,
                    //     password: _controllerPassword.text);
                    // setSate(() {});
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  color: Color(0xff0095FF),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?"),
                  Text(
                    " Login",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  void setSate(Null Function() param0) {}
}

// we will be creating a widget for text field
Widget inputFile({label, obscureText = false, userCon}) {
  print(userCon);
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
      TextFormField(
        obscureText: obscureText,
        controller: userCon,
        validator: (value) {
          if (value!.isEmpty) {
            return null;
          } else {
            return "filed cannot be empty";
          }
        },
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
