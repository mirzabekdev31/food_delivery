import 'package:flutter/material.dart';
import 'package:food_delivery/view/home_page/home_page.dart';

import '../../color/app_color.dart';
class MyPrfilPage extends StatefulWidget {
  const MyPrfilPage({Key? key}) : super(key: key);
  static const String id="my_profil_page";

  @override
  _MyPrfilPageState createState() => _MyPrfilPageState();
}

class _MyPrfilPageState extends State<MyPrfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(

        backgroundColor: AppColor.background,
        leading: IconButton(
            onPressed: (){
              Navigator.pushNamed(context, HomePage.id);
            },
            icon: const Icon(Icons.arrow_back_ios,color: Colors.black,)
        ),

        title: const Text("My Profil",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
        centerTitle: true,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 50,top: 60),
        child: Column(
          children: const [
          ],
        ),
      ),
    );
  }
}
