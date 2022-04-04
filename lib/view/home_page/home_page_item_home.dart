import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:food_delivery/view/home_page/basket_page.dart';
import 'package:food_delivery/view/home_page/foods/foods_page.dart';

import '../../color/app_color.dart';
import 'custom_advensed_drover.dart';
class HomePageItem extends StatefulWidget {
  const HomePageItem({Key? key}) : super(key: key);

  @override
  _HomePageItemState createState() => _HomePageItemState();
}

class _HomePageItemState extends State<HomePageItem> with SingleTickerProviderStateMixin{

  final _advancedDrawerController = AdvancedDrawerController();


  void _handleMuneButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =  TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    final _controller=TextEditingController();

    return CustomAdvancedDrawer(
      advancedDrawerController: _advancedDrawerController,
      child: Scaffold(
        backgroundColor: AppColor.appbarbecgraund,

        body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50,top: 43,right:50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Image.asset('assets/images/drower.png'),
                          onPressed: () {
                            _handleMuneButtonPressed();
                          },
                        ),
                        IconButton(
                            onPressed: (){
                              Navigator.pushNamed(context, BasketPage.id);
                            },
                            icon: Image.asset("assets/images/shopping.png")
                        )
                      ],
                    ),
                    const SizedBox(height: 43.33,),
                    const Text("Delicious\nfood for you",style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color: Colors.black),),
                    const SizedBox(height: 28,),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColor.searchColor
                        ),
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            border:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            ),
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 46,),
                    Container(
                      child: TabBar(
                          controller: _tabController,
                          labelColor: Colors.red,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: const UnderlineTabIndicator(
                            borderSide: BorderSide(width: 3.0,color: Colors.red),
                            insets: EdgeInsets.symmetric(horizontal:60.0),
                          ),
                          indicatorColor: Colors.red,
                          labelPadding: EdgeInsets.only(bottom: 20),
                          tabs: const [
                            Text("Foods",style: TextStyle(color: Colors.black),),
                            Text("Drinks",style: TextStyle(color: Colors.black),),

                          ]
                      ),
                    ),
                  ],
                ),
              ),
               Expanded(
                    child: Container(
                          padding:const EdgeInsets.only(left: 50,top: 43),
                          child: TabBarView(
                            controller: _tabController,
                            children: const [
                             Expanded(child: FoodsPage()),
                             Expanded(child: Text("Hello"))
                            ],
                          ),
                        ),
                ),
            ],
          ),
      ),
    );
  }
}
