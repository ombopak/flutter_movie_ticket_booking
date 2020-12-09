import 'package:bwaflutix_dewveloper/services/services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text("Sign Up"),
                  onPressed: () async {
                    SignInSignUpResult result = await AuthServices.signUp(
                        "admin@ombopak.com",
                        "123456",
                        "admin",
                        ["Action", "Horror", "Music", "Drama"],
                        "Korean");

                    if (result.user == null) {
                      print(result.user);
                    } else {
                      print(result.user.toString());
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
