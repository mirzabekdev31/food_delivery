import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/view/advertising_page.dart';
import 'package:food_delivery/view/home_page/basket_page.dart';
import 'package:food_delivery/view/home_page/foods/PizzaDetails.dart';
import 'package:food_delivery/view/home_page/home_page.dart';
import 'package:food_delivery/view/home_page/my_profil_page.dart';
import 'package:food_delivery/view/home_page/offer_and_promo.dart';
import 'package:food_delivery/view/home_page/privacy_policy.dart';
import 'package:food_delivery/view/regester_pages/regester_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_delivery/view_model/auth_view_model.dart';
import 'package:food_delivery/view_model/post_vm.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider.value(
        value: AuthViewModel(),
      ),
      ChangeNotifierProvider.value(
        value: PizzaViewModel(),
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
          : const HomePage(),


      //const AdvertisingPage(),
      routes: {
        RegesterPage.id: (context) => const RegesterPage(),
        HomePage.id: (context) => const HomePage(),
        BasketPage.id: (context) => const BasketPage(),
        OfferAndPromo.id: (context) => const OfferAndPromo(),
        PrivacyPolicy.id: (context) => const PrivacyPolicy(),
        MyPrfilPage.id: (context) => const MyPrfilPage(),
        PizzaDetails.id: (context) => const PizzaDetails(),
      },
    );
  }
}
