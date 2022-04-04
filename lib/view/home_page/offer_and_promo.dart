import 'package:flutter/material.dart';
import '../../color/app_color.dart';
class OfferAndPromo extends StatefulWidget {
  const OfferAndPromo({Key? key}) : super(key: key);
  static const String id="offer_and_promo";

  @override
  _OfferAndPromoState createState() => _OfferAndPromoState();
}

class _OfferAndPromoState extends State<OfferAndPromo> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios,color: Colors.black,)
        ),

        title: const Text("Offer And Promo",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
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
