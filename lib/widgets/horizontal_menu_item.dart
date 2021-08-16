import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/controllers.dart';
import 'package:myapp/constants/style.dart';
import 'package:myapp/widgets/custom_text.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;
  const HorizontalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuController.onHover(itemName)
            : menuController.onHover("not hovering");
      },
      child: Obx(() => Container(
          color: menuController.isHover(itemName)
              ? lightGrey.withOpacity(.1)
              : Colors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: menuController.isHover(itemName) ||
                    menuController.isActive(itemName),
                child: Container(
                  width: 6,
                  height: 40,
                  color: darke,
                ),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
              ),
              SizedBox(
                width: _width / 80,
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: menuController.returnIconFor(itemName),
              ),
              if (!menuController.isActive(itemName))
                Flexible(
                    child: CustomText(
                  text: itemName,
                  color: menuController.isHover(itemName) ? darke : lightGrey,
                ))
              else
                Flexible(
                    child: CustomText(
                  text: itemName,
                  color: darke,
                  size: 18,
                  weight: FontWeight.bold,
                ))
            ],
          ))),
    );
  }
}
