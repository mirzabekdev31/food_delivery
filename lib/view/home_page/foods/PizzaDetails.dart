import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../color/app_color.dart';
import '../../../model/food_model.dart';
import '../../../model/item_model.dart';
import '../../../view_model/post_vm.dart';
class PizzaDetails extends StatefulWidget {
  const PizzaDetails({Key? key}) : super(key: key);
  static const String id="pizza_details";

  @override
  _PizzaDetailsState createState() => _PizzaDetailsState();
}

class _PizzaDetailsState extends State<PizzaDetails> {
  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context)!.settings.arguments as Map<String,Item>;
    Item?  item=args["infor"];

    final authVM = Provider.of<PizzaViewModel>(context, listen: false);
    authVM.fetchPosts();
    final postsRef=authVM.fetchPosts();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: StreamBuilder<QuerySnapshot<MyFood>>(
          stream: postsRef.snapshots(),
          builder: (context,snapshot){
            if(snapshot.hasError){
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            }else {
              return Consumer<PizzaViewModel>(
                  builder: (context, data, index){
                    return ListView.builder(
                        itemCount: snapshot.data?.size,
                        itemBuilder: (context,index){
                          final item=snapshot.data!.docs[index].data();
                          return pizzaInfor(
                            item,
                          );
                        });
                  }
              );
            }
          },
        ) ,
      ),
    );
  }


  Widget pizzaInfor(MyFood pizza) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 200,
      width: 200,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                    child: Image.network(
                      pizza.imageUrl.toString(),
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),

                  ),
                ),
                Text(pizza.pizzaName.toString(),style: const TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w600),),
                const SizedBox(height: 15,),
                Text('${pizza.price.toString()} so\'m',style: const TextStyle(color: AppColor.loginColor,fontSize: 17,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          const SizedBox(width: 34,)
        ],
      ),
    );
  }

}
