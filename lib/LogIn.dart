import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nice_button/NiceButton.dart';
import 'HomePage.dart';
import 'SignUp.dart';
void main() => runApp(new LogIn());

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
FirebaseAuth mAuth=FirebaseAuth.instance;
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  var firstColor = Color(0xffeceff1), secondColor = Color(0xff263238);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text('MED',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                    child: Text('SWAG',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(240, 100, 10, 0),
                      child:Image.asset('assets/srlogo.png')
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onChanged: (input) => _email = input,
                      decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 40.0),
                    TextFormField(
                      onChanged: (input) => _password = input,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      obscureText: true,
                    ),
                    SizedBox(height: 5.0),
                    SizedBox(height: 100.0),
                    Container(

                        child: NiceButton(
                          radius: 40,
                          padding: const EdgeInsets.all(15),
                          text: "Log In",
                          icon: Icons.account_box,
                          gradientColors: [secondColor, firstColor],

                          onPressed: () {
                            signIn();
                          },
                        )
                    ),
                    SizedBox(height: 20.0),
                    Container(

                        child: NiceButton(
                          radius: 40,
                          padding: const EdgeInsets.all(15),
                          text: "Log In as ADMIN",
                          icon: Icons.account_box,
                          gradientColors: [secondColor, firstColor],

                          onPressed: () {

                          },
                        )
                    ),
                    SizedBox(height: 20.0),
                    Container(

                        child: NiceButton(
                          radius: 40,
                          padding: const EdgeInsets.all(15),
                          text: "Sign Up",
                          icon: Icons.account_box,
                          gradientColors: [secondColor, firstColor],

                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                          },
                        )
                    ),
                  ],
                )),
          ],
        ));
  }
  void signIn() async {
    try {
      UserCredential userCredential;
      userCredential = await mAuth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      print('user found for that email.');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

  }
}
