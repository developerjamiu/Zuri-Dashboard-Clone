import 'package:flutter/material.dart';

import '../contents/constants/app_colors.dart';
import '../models/course_enrollable.dart';

class CoursesEnrolledIn extends StatelessWidget {
  final coursesEnrolledIn = const [
    CourseEnrollable(
      track: "Mobile",
      courseName: "Flutter",
      description: 'Flutter Description',
    ),
    CourseEnrollable(
      track: "General",
      courseName: "General Introduction",
      description: 'General Introduction',
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
              "Courses Enrolled In",
              style: textTheme.headline6?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 16,
                horizontalMargin: 8,
                columns: [
                  DataColumn(label: Text('TRACK', style: titleText)),
                  DataColumn(label: Text('COURSE NAME', style: titleText)),
                  DataColumn(label: Text('DESCRIPTION', style: titleText)),
                ],
                rows: List.generate(
                  coursesEnrolledIn.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(
                        Text(
                          coursesEnrolledIn[index].track,
                          style: textTheme.bodyText2,
                        ),
                      ),
                      DataCell(
                        Text(
                          coursesEnrolledIn[index].courseName,
                          style: textTheme.bodyText2,
                        ),
                      ),
                      DataCell(
                        Text(
                          coursesEnrolledIn[index].description,
                          style: textTheme.bodyText2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
