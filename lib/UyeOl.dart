import 'package:flutter/material.dart';

void main() {
  runApp(UyeOl());
}

class UyeOl extends StatefulWidget {
  @override
  _UyeOlState createState() => _UyeOlState();
}

class _UyeOlState extends State<UyeOl> {
  String email;
  String kullaniciAdi;
  String sifre;
  String sifreTekrar;

  final _uyekey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: _uyekey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email Adresi",
                    labelStyle: TextStyle(color: Colors.red),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    email = value;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Kullanıcı Adı",
                    labelStyle: TextStyle(color: Colors.red),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    kullaniciAdi = value;
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
                    sifre = value;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Şifre Tekrar",
                    labelStyle: TextStyle(color: Colors.red),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    sifreTekrar = value;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                        child: Text("Vazgeç"),
                        onPressed: () {
                          Navigator.pushNamed(context, "/");
                        }),
                    MaterialButton(
                      child: Text("Kaydol"),
                      onPressed: () {
                        _uyekey.currentState.save();
                        debugPrint(
                            "email: $email, Kullanıcı Adı : $kullaniciAdi, Şifre : $sifre, Şifre Tekrar : $sifreTekrar");
                        if (sifre == sifreTekrar) {
                          debugPrint(" Şifre ile Şifre Terkarı Aynı");
                          Navigator.pushNamed(context, "/");
                        } else {
                          debugPrint("Şifre ile Şifre Tekrarı Aynı Değil....");
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
