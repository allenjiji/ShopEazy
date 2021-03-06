import 'package:flutter/material.dart';
import './homepage.dart';
import 'package:provider/provider.dart';
import '../providers/ProductProvider.dart';

class LoginPage extends StatefulWidget {
  static final routeName = '/loginpage';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var username = new TextEditingController();
  var passwordd = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<Products>(context);
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logopng.png'),
      ),
    );

    final email = TextFormField(
      controller: username,
      //keyboardType: TextInputType.emailAddress,
      autofocus: false,
      // initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding:const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      controller: passwordd,
      autofocus: false,
      // initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          String uname = username.text;
          String pword = passwordd.text;
          var a = prod.loginUser(username: uname, password: pword);
          a.then((val) {
            if (val == '1')
              Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          });
        },
        padding: const EdgeInsets.all(12),
        color: Colors.purpleAccent,
        child: const Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding:const  EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            const SizedBox(height: 48.0),
            email,
            const SizedBox(height: 8.0),
            password,
            const SizedBox(height: 24.0),
            loginButton,
          ],
        ),
      ),
    );
  }
}
