import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learn_provider/views/ProductHome.dart';
import 'package:learn_provider/views/login.dart';
class GoogleAuth with ChangeNotifier{
  signInWithGoogle(context)async{
    final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  final GoogleSignInAccount? useraccount =await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? _auth=await useraccount!.authentication;
  final credential =GoogleAuthProvider.credential(idToken: _auth!.idToken,accessToken: _auth.accessToken);

  await firebaseAuth.signInWithCredential(credential);
  if(firebaseAuth.currentUser!=null){
Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductHome()));
  }else{
    print("error");
  }
  notifyListeners();
  }

  signout(context)async{
 final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  await firebaseAuth.signOut();
 if(firebaseAuth.currentUser==null){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
 }
  }

}