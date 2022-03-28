
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:food_delivery/color/app_color.dart';
import 'package:food_delivery/view/home_page/home_page.dart';


class CustomAdvancedDrawer extends StatefulWidget {
  final Widget child;
  final AdvancedDrawerController advancedDrawerController;

  const CustomAdvancedDrawer(
      {Key? key, required this.child, required this.advancedDrawerController})
      : super(key: key);

  @override
  _CustomAdvancedDrawerState createState() => _CustomAdvancedDrawerState();
}

class _CustomAdvancedDrawerState extends State<CustomAdvancedDrawer> {
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      animationCurve: Curves.easeInOut,
      backdropColor: AppColor.loginColor,
      animateChildDecoration: false,
      animationDuration: const Duration(milliseconds: 300),
      controller: widget.advancedDrawerController,
      childDecoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      child: widget.child,
      drawer: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 12),
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 18, bottom: 12, top: 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                    ],
                  ),
                ),
                _buildListTile(
                  'Profile',
                  Icons.person,
                    (){
                    Navigator.pushNamed(context, HomePage.id);
                    }
                ),
                SizedBox(height: 26,),

                _buildListTile('Orders', Icons.bookmark, () {

                }),
                SizedBox(height: 26,),

                _buildListTile(
                  'offer and promo',
                  Icons.edit,
                      () {}
                ),
                SizedBox(height: 26,),

                _buildListTile('Privacy policy', Icons.credit_card, () {}),
                SizedBox(height: 26,),

                _buildListTile('Security', Icons.help, () {}),
                SizedBox(height: 26,),
                 Padding(
                  padding: EdgeInsets.only(left: 16, top: 36),
                  child: TextButton(
                    onPressed: (){

                    },
                    child: Text(
                          "Sign-out ->",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListTile _buildListTile(String title, IconData image, void Function() func) {
    return ListTile(
      onTap: func,
      leading: Icon(image),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            SizedBox(height: 4,),
            Container(
              height: 1,
              width: 150,
              color: Colors.white,)
          ],
      ),
    );
  }
}