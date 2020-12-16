import 'package:flutter/material.dart';
import 'package:vize_odevi/UyeOl.dart';
import 'package:vize_odevi/anaSayfa.dart';
import 'package:vize_odevi/sifremiUnuttum.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => loginSayfa(),
      '/UyeOl': (context) => UyeOl(),
      '/sifremiUnuttum': (context) => sifremiUnuttum(),
      '/anaSayfa': (context) => anaSayfa(),
    },
  ));
}

class loginSayfa extends StatefulWidget {
  @override
  _loginSayfaState createState() => _loginSayfaState();
}

class _loginSayfaState extends State<loginSayfa> {
  String username;
  String password;
  final _degerKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: _degerKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Kullanıcı Adı",
                    labelStyle: TextStyle(color: Colors.red),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    username = value;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Şifre",
                    labelStyle: TextStyle(color: Colors.red),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    password = value;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      child: Text("Üye Ol"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/UyeOl');
                      },
                    ),
                    MaterialButton(
                        child: Text("Şifremi Unuttum"),
                        onPressed: () {
                          Navigator.pushNamed(context, '/sifremiUnuttum');
                        }),
                  ],
                ),
                RaisedButton(
                  child: Text("Giriş"),
                  onPressed: () {
                    _degerKey.currentState.save();
                    debugPrint("username : $username,  password : $password");
                    if (username == "demo" && password == "demo") {
                      debugPrint("Giriş Başarılı...");
                      Navigator.pushNamed(context, '/anaSayfa');
                    } else {
                      debugPrint("Kullanıcı Adı veya Şifre Hatalı...");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
