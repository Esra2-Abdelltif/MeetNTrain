

import 'package:flutter/material.dart';
import 'package:meet_n_train_app/core/utils/color_manager.dart';
import 'package:meet_n_train_app/core/utils/font_manager.dart';


class DollarContainer extends StatelessWidget {
  const DollarContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                        width: 20,
                        height: 20,
                        //padding: EdgeInsets.only(bottom: 1),
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColor.primaryColor)),
                        child: Center(
                          child: Text(
                            '\$',
                            style: TextStyle(color: AppColor.primaryColor,fontSize: 12,fontWeight: FontWeight.w500),
                          ),
                        ));
  }
}