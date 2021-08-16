import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/style.dart';
import 'package:myapp/routing/routes.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = OverViewPageroute.obs;
  var hoverItem = "".obs;

  changeActiveitemTo(String iteamName) {
    activeItem.value = iteamName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value = itemName;

  isHover(String itemName) => activeItem.value = itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case OverViewPageroute:
        return _customIcon(Icons.trending_up, itemName);
      case DriversPageroute:
        return _customIcon(Icons.drive_eta, itemName);
      case ClientsPageroute:
        return _customIcon(Icons.people_alt_outlined, itemName);
      case AuthenticationPageroute:
        return _customIcon(Icons.trending_up, itemName);

      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 32, color: darke);

    return Icon(icon, color: isHover(itemName) ? darke : lightGrey);
  }
}
