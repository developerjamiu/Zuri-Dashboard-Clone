import 'package:flutter/material.dart';
import 'package:responsive_zuriboard/src/contents/utilities/responsive.dart';

import '../components/courses_enrolled_in.dart';
import '../components/dashboard_tiles.dart';
import '../components/intro_header.dart';
import '../components/latest_tasks.dart';
import '../components/recent_posts.dart';
import '../contents/utilities/spacing.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Spacing.largeHeight(),
            IntroHeader(),
            Spacing.largeHeight(),
            Responsive(
              mobile: DashboardTiles(
                crossAxisCount: 1,
              ),
              tablet: DashboardTiles(
                crossAxisCount: 1,
                widthRatio: 3.0,
              ),
              laptop: DashboardTiles(
                crossAxisCount: 1,
              ),
              desktop: DashboardTiles(
                widthRatio: 0.7,
              ),
            ),
            Spacing.bigHeight(),
            if (Responsive.isLaptop(context) || Responsive.isDesktop(context))
              Row(
                children: [
                  Expanded(child: RecentPosts()),
                  Spacing.smallWidth(),
                  Expanded(child: LatestTasks()),
                ],
              ),
            if (Responsive.isTablet(context) || Responsive.isMobile(context))
              Column(
                children: [
                  RecentPosts(),
                  Spacing.mediumHeight(),
                  LatestTasks(),
                ],
              ),
            Spacing.bigHeight(),
            SizedBox(
              width: double.infinity,
              child: CoursesEnrolledIn(),
            ),
            Spacing.largeHeight(),
            Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('\u00a9 2021 | POWERED BY ZURI'),
            ),
            Spacing.mediumHeight(),
          ],
        ),
      ),
    );
  }
}
