import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../contents/constants/app_colors.dart';
import '../contents/utilities/responsive.dart';
import '../models/dashboard_info.dart';

class DashboardTiles extends StatelessWidget {
  final int crossAxisCount;
  final double widthRatio;

  const DashboardTiles({
    Key? key,
    this.crossAxisCount = 4,
    this.widthRatio = 2.6,
  }) : super(key: key);

  final dashboardInfos = const [
    DashboardInfo(
      icon: LineAwesomeIcons.signal,
      title: 'Stage',
      value: '2',
    ),
    DashboardInfo(
      icon: LineAwesomeIcons.cubes,
      title: 'Total Stages',
      value: '10',
    ),
    DashboardInfo(
      icon: LineAwesomeIcons.chalkboard,
      title: 'Total Points',
      value: '27.5 / 29',
    ),
    DashboardInfo(
      icon: LineAwesomeIcons.chalkboard,
      title: 'Track & Course',
      value: 'Mobile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    var width = _size.width;
    var height = _size.height / widthRatio;
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: width / height,
      ),
      itemBuilder: (context, index) => DashboardInfoListItem(
        dashboardInfo: dashboardInfos[index],
      ),
    );
  }
}

class DashboardInfoListItem extends StatelessWidget {
  const DashboardInfoListItem({
    Key? key,
    required this.dashboardInfo,
  }) : super(key: key);

  final DashboardInfo dashboardInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Column(
          children: [
            Icon(
              dashboardInfo.icon,
              size: Responsive.isTablet(context) ? 36 : 48,
              color: AppColors.primaryColor,
            ),
            Spacer(),
            Text(
              dashboardInfo.title,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Spacer(flex: 2),
            Text(
              dashboardInfo.value,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: AppColors.primaryColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
