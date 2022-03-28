import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/view/advertising_page.dart';
import 'package:food_delivery/view/home_page/basket_page.dart';
import 'package:food_delivery/view/home_page/home_page.dart';
import 'package:food_delivery/view/regester_pages/regester_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_delivery/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider.value(
        value: AuthViewModel(),
      ),
    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,

      home: FirebaseAuth.instance.currentUser?.uid == null
          ? AdvertisingPage()
          : HomePage(),


      //const AdvertisingPage(),
      routes: {
        RegesterPage.id: (context) => RegesterPage(),
        HomePage.id: (context) => HomePage(),
        BasketPage.id: (context) => BasketPage(),
      },
    );
  }
}
