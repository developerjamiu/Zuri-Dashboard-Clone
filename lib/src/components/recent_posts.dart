import 'package:flutter/material.dart';

import '../contents/constants/app_colors.dart';
import '../models/recent_post.dart';
import '../contents/utilities/spacing.dart';

class RecentPosts extends StatelessWidget {
  final recentPosts = const [
    RecentPost(
      title: "Week 9 - Connecting Your App to the Internet 2",
      date: "Tue 11, May 2021",
      category: 'KOTLIN',
      author: 'SammyBloom',
    ),
    RecentPost(
      title: "Week 9 - Connecting Your App to the Internet 1",
      date: "Tue 11, May 2021",
      category: 'KOTLIN',
      author: 'SammyBloom',
    ),
    RecentPost(
      title: "Week 8 - Room Database",
      date: "Tue 11, May 2021",
      category: 'KOTLIN',
      author: 'SammyBloom',
    ),
    RecentPost(
      title: "Week 8 - Database and SQLite",
      date: "Tue 11, May 2021",
      category: 'KOTLIN',
      author: 'SammyBloom',
    ),
    RecentPost(
      title: "Week 7 - A Better Way 2",
      date: "Tue 11, May 2021",
      category: 'KOTLIN',
      author: 'SammyBloom',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final titleText = textTheme.bodyText1?.copyWith(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.bold,
    );
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recent Posts",
              style: textTheme.headline6?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 16,
                dataRowHeight: 80,
                horizontalMargin: 8,
                columns: [
                  DataColumn(label: Text('TITLE', style: titleText)),
                  DataColumn(label: Text('AUTHOR', style: titleText)),
                  DataColumn(label: Text('CATEGORY', style: titleText)),
                ],
                rows: List.generate(
                  recentPosts.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recentPosts[index].title,
                              style: titleText,
                            ),
                            Text(
                              recentPosts[index].date,
                              style: textTheme.bodyText1?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      DataCell(
                        Text(
                          recentPosts[index].author,
                          style: textTheme.bodyText2,
                        ),
                      ),
                      DataCell(
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AppColors.onSurfaceColor,
                              width: 0.5,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 3,
                            horizontal: 8,
                          ),
                          child: Text(
                            recentPosts[index].category,
                            style: textTheme.caption,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacing.mediumHeight(),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Show all Posts',
                style: textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSecondaryColor,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: AppColors.secondaryColor,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
