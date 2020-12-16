import 'package:flutter/material.dart';

void main() {
  runApp(sifremiUnuttum());
}

class sifremiUnuttum extends StatefulWidget {
  @override
  _sifremiUnuttumState createState() => _sifremiUnuttumState();
}

class _sifremiUnuttumState extends State<sifremiUnuttum> {
  String email;
  final _mail = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: _mail,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email Adresini Giriniz.",
                    labelStyle: TextStyle(color: Colors.red),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    email = value;
                  },
                ),
                SizedBox(height: 20),
                MaterialButton(
                  child: Text("Gönder"),
                  onPressed: () {
                    _mail.currentState.save();
                    debugPrint("Email Adresiniz : $email");
                    debugPrint(
                        "Email Adresinize Şifre Sıfırlama Gönderildi...");
                    Navigator.pushNamed(context, "/");
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
