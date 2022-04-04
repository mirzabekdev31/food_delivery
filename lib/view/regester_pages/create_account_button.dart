import 'package:flutter/material.dart';
import 'package:food_delivery/color/app_color.dart';

class CreateButton extends StatelessWidget {
  final void Function() func;
  const CreateButton({
    Key? key,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: InkWell(
        onTap: () {
          func();
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColor.loginColor,
          ),
          height: 56,
          width: double.infinity,
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Login',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}