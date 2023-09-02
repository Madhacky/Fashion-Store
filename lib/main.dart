import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learn_provider/controllers/GoogleSign.dart';
import 'package:learn_provider/views/ProductHome.dart';
import 'package:learn_provider/controllers/providerClass.dart';
import 'package:learn_provider/views/login.dart';
import 'package:provider/provider.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( 
  const MyApp(),
  
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
    
    
    MultiProvider(
      providers: [
        
        ChangeNotifierProvider(  create:(context)=> ProviderClass()),
        ChangeNotifierProvider(create: (context)=>GoogleAuth())
        ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    ),);
    
  }
}


