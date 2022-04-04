import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/color/app_color.dart';
import 'package:food_delivery/view/home_page/foods/PizzaDetails.dart';

import '../../../model/item_model.dart';
class FoodsPage extends StatefulWidget {
  const FoodsPage({Key? key}) : super(key: key);
  static const String id="foods_page";

  @override
  _FoodsPageState createState() => _FoodsPageState();
}

class _FoodsPageState extends State<FoodsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Item.item.length,
          itemBuilder: (BuildContext contex,int index){
            return FoodItem(Item.item[index]);
          }
      ),
    );
  }

  Widget FoodItem(Item item){
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, PizzaDetails.id,arguments: {
          'item':item
        });
      },
      child: Row(
        children: [
          Container(
            height: 270,
            width: 220,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.white
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image(
                        image: AssetImage(item.image.toString())
                    ),

                  ),
                ),
                Text(item.name.toString(),style: const TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w600),),
                const SizedBox(height: 15,),
                Text(item.price.toString(),style: const TextStyle(color: AppColor.loginColor,fontSize: 17,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          const SizedBox(width: 34,)
        ],
      ),
    );
  }

}