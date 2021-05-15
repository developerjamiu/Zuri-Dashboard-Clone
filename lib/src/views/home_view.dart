import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../contents/utilities/spacing.dart';
import '../contents/constants/app_colors.dart';
import '../contents/constants/app_images.dart';
import '../contents/utilities/responsive.dart';
import '../controllers/menu_controller.dart';
import 'dashboard_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      appBar: AppHeader(),
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context) || Responsive.isLaptop(context))
              Container(
                width: 130,
                child: SideMenu(isMobile: false),
              ),
            Expanded(
              child: DashboardView(),
            ),
          ],
        ),
      ),
      drawer: SideMenu(isMobile: true),
    );
  }
}

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: AppColors.surfaceColor,
      leading: GestureDetector(
        onTap: context.read<MenuController>().openDrawer,
        child: Align(
          alignment: Alignment.centerRight,
          child: Icon(LineAwesomeIcons.bars, size: 32),
        ),
      ),
      leadingWidth: 64,
      title: Image.asset(
        AppImages.appLogo,
        height: 24,
      ),
      actions: [
        Icon(LineAwesomeIcons.bell),
        Spacing.bigWidth(),
        CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.onSurfaceColor,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.backgroundColor,
            child: Icon(
              LineAwesomeIcons.user,
              color: AppColors.onSurfaceColor,
            ),
          ),
        ),
        Spacing.largeWidth(),
      ],
    );
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
    required this.isMobile,
  }) : super(key: key);

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeTile(
                iconData: LineAwesomeIcons.alternate_tachometer,
                title: 'Dashboard',
                isMobile: isMobile,
              ),
              HomeTile(
                iconData: LineAwesomeIcons.tasks,
                title: 'Tasks',
                isMobile: isMobile,
              ),
              HomeTile(
                iconData: LineAwesomeIcons.user_friends,
                title: 'Teams',
                isMobile: isMobile,
              ),
              HomeTile(
                iconData: LineAwesomeIcons.alternate_file,
                title: 'Posts',
                isMobile: isMobile,
              ),
              HomeTile(
                iconData: LineAwesomeIcons.alternate_user,
                title: 'User Profile',
                isMobile: isMobile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeTile extends StatelessWidget {
  const HomeTile({
    Key? key,
    required this.iconData,
    required this.title,
    this.isMobile = false,
  }) : super(key: key);

  final IconData iconData;
  final String title;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              child: isMobile
                  ? Row(
                      children: [
                        Spacing.mediumWidth(),
                        Icon(iconData, size: 32),
                        Spacing.mediumWidth(),
                        Text(
                          title,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Icon(iconData, size: 32),
                        Spacing.smallHeight(),
                        Text(
                          title,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
            ),
            Divider(height: 0),
          ],
        ),
      ),
    );
  }
}
