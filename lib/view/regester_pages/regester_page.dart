import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/color/app_color.dart';
import 'package:food_delivery/view/regester_pages/sign_up_pahe.dart';

import 'login_page.dart';
class RegesterPage extends StatefulWidget {
  const RegesterPage({Key? key}) : super(key: key);
  static const String id="regester_page";

  @override
  _RegesterPageState createState() => _RegesterPageState();
}

class _RegesterPageState extends State<RegesterPage> with SingleTickerProviderStateMixin{

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


    return Scaffold(
      backgroundColor: AppColor.background,
      body:Column(
          children: [
            Container(
              height: 282,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40)),
                  color: Colors.white
              ),
              child:  Stack(
                children: [
                  const Center(
                    child:  Image(
                      height: 162,
                      width: 131,
                      image: AssetImage("assets/images/icook2.png"),
                      fit: BoxFit.cover,
                    ),

                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
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
                              Text("Login",style: TextStyle(color: Colors.black),),
                              Text("Sign Up",style: TextStyle(color: Colors.black),),

                            ]
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Expanded(
              child:TabBarView(
                controller: _tabController,
                children: const [
                  LoginPage(),
                  SignUpPage(),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
