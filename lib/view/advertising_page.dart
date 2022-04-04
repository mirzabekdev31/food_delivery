import 'package:flutter/material.dart';
import 'package:food_delivery/color/app_color.dart';
import 'package:food_delivery/view/regester_pages/regester_page.dart';
class AdvertisingPage extends StatefulWidget {
  const AdvertisingPage({Key? key}) : super(key: key);
  static const String id="advertising_page";

  @override
  _AdvertisingPageState createState() => _AdvertisingPageState();
}

class _AdvertisingPageState extends State<AdvertisingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    AppColor.gradientColor1,
                    AppColor.gradientColor2
                  ]
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 56,left: 56),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 73,
                      width: 73,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.white
                      ),
                      child: const Center(
                        child: Image(
                          image: AssetImage("assets/images/ic_cook.png"),
                        ),
                      ),
                    ),
                    const SizedBox(height: 31,),
                    const Text("Food for\nEveryone",style: TextStyle(color: Colors.white,fontSize: 63,fontWeight: FontWeight.bold,)),
                    //SizedBox(height: 218,),

                  ],
                ),
              ),

               const SizedBox(height: 10,),

               const Center(
                 child: ClipOval(
                    child: Image(
                      height: 250,
                        width: 250,
                        image: AssetImage("assets/images/cook2.png")
                    )
              ),
               ),

              const SizedBox(height: 40,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RegesterPage.id);
                  },
                  child: Container(
                    height: 70,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text("Get started",style: TextStyle(color: Colors.red,fontSize: 17,fontWeight: FontWeight.w600),),
                    ),
                  ),
                )
              ],
              )
            ],
          ),
        ],
      ),

    );
  }
}
