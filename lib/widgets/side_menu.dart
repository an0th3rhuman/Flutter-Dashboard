import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/controllers.dart';
import 'package:myapp/constants/style.dart';
import 'package:myapp/helpers/responsiveness.dart';
import 'package:myapp/routing/routes.dart';
import 'package:myapp/widgets/custom_text.dart';
import 'package:myapp/widgets/side_menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: _width / 48,
                    ),
                    Padding(padding: EdgeInsets.only(right: 12)
                        //child: Image.asset("assets/icons/logo.png"),
                        ),
                    Flexible(
                        child: CustomText(
                      text: "Dash",
                      size: 20,
                      weight: FontWeight.bold,
                      color: active,
                    )),
                    SizedBox(
                      width: _width / 48,
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Divider(
                  color: lightGrey.withOpacity(.1),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: sideMenuItems
                      .map((itemName) => SideMenuItem(
                            itemName: itemName == AuthenticationPageroute
                                ? "Logout"
                                : itemName,
                            onTap: () {
                              if (itemName == AuthenticationPageroute) {
                                //TODO: go to Auth page
                              }

                              if (!menuController.isActive(itemName)) {
                                menuController.changeActiveitemTo(itemName);
                                if (ResponsiveWidget.isSmallScreen(context))
                                  // ignore: unnecessary_statements
                                  Get.back();

                                //TODO go to itemname route
                              }
                            },
                          ))
                      .toList(),
                )
              ],
            )
        ],
      ),
    );
  }
}
