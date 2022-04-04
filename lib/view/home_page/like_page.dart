import 'package:flutter/material.dart';

import '../../color/app_color.dart';
import 'home_page.dart';
class LikePage extends StatefulWidget {
  const LikePage({Key? key}) : super(key: key);


  @override
  _LikePageState createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
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

        title: const Text("Like",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
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
