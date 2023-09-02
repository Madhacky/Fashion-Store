import 'package:flutter/material.dart';
import 'package:learn_provider/controllers/GoogleSign.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GoogleAuth>(
        builder: (context,data,widget) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
Text("FASHION BOX",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,),),

              Lottie.asset(
                "assets/loginImage.json",
              ),
              Center(
                  child: ElevatedButton(
                onPressed: () {
                  data.signInWithGoogle(context);
             
                },
                child: Text(
                  "GOOGLE SIGN IN",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(fixedSize: Size(250, 80)),
              ))
            ],
          );
        }
      ),
    );
  }
}
