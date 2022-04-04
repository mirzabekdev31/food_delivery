import 'package:flutter/material.dart';
import 'package:food_delivery/color/app_color.dart';
class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);
  static const String id="basket_page";

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(

        backgroundColor: AppColor.background,
        leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios,color: Colors.black,)
          ),

        title: const Text("Orders",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
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
