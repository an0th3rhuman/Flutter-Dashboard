import 'package:flutter/material.dart';
import 'package:myapp/helpers/responsiveness.dart';
import 'package:myapp/widgets/large_screen.dart';
import 'package:myapp/widgets/small_screen.dart';
import 'package:myapp/widgets/top_nav.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: topNavigationBar(context, scaffoldkey),
      drawer: Drawer(),
      body: ResponsiveWidget(largeScreen: LargeScreen(),smallScreen: SmallScreen(),)

      
    );
  }
}