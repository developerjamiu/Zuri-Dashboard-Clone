import 'package:flutter/material.dart';

import '../contents/constants/app_colors.dart';
import '../contents/utilities/spacing.dart';
import '../models/latest_task.dart';

class LatestTasks extends StatelessWidget {
  final latestTasks = const [
    LatestTask(
      course: "Flutter",
      category: 'Mobile',
      taskTitle: 'Flutter 1.1: Portfolio app',
      taskPoints: '8',
      deadline: 'Submission Closed',
      status: 'Graded(8.00)',
    ),
    LatestTask(
      course: "Flutter",
      category: 'Mobile',
      taskTitle: 'Flutter 1.0: Fix overflow error',
      taskPoints: '1',
      deadline: 'Submission Closed',
      status: 'Graded(1.00)',
    ),
    LatestTask(
      course: "Flutter",
      category: 'Mobile',
      taskTitle: 'Dart: 2.5: Console bank',
      taskPoints: '7',
      deadline: 'Submission Closed',
      status: 'Graded(7.00)',
    ),
    LatestTask(
      course: "Flutter",
      category: 'Mobile',
      taskTitle: 'Dart 2.0: Functions',
      taskPoints: '5',
      deadline: 'Submission Closed',
      status: 'Graded(5.00)',
    ),
    LatestTask(
      course: "Flutter",
      category: 'Mobile',
      taskTitle: 'Dart 1.0',
      taskPoints: '3',
      deadline: 'Submission Closed',
      status: 'Graded(3.00)',
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
              "Latest Tasks",
              style: textTheme.headline6?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 8,
                dataRowHeight: 80,
                horizontalMargin: 8,
                columns: [
                  DataColumn(label: Text('COURSE', style: titleText)),
                  DataColumn(label: Text('TASK TITLE', style: titleText)),
                  DataColumn(label: Text('TASK\nPOINTS', style: titleText)),
                  DataColumn(label: Text('STATUS', style: titleText)),
                  DataColumn(label: Text('DEADLINE', style: titleText)),
                  DataColumn(label: Text('...', style: titleText)),
                ],
                rows: List.generate(
                  latestTasks.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              latestTasks[index].course,
                              style: textTheme.bodyText2,
                            ),
                            Text(
                              latestTasks[index].category,
                              style: textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                      DataCell(
                        Text(
                          latestTasks[index].taskTitle,
                          style: textTheme.bodyText2,
                        ),
                      ),
                      DataCell(
                        Text(
                          latestTasks[index].taskPoints,
                          style: textTheme.bodyText2,
                        ),
                      ),
                      DataCell(
                        Text(
                          latestTasks[index].status,
                          style: textTheme.caption?.copyWith(
                            color: Colors.green,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          latestTasks[index].deadline,
                          style: textTheme.bodyText2,
                        ),
                      ),
                      DataCell(
                        Text(
                          'View',
                          style: textTheme.bodyText2,
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
                'Show all Tasks',
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
