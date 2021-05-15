import 'package:flutter/material.dart';
import 'package:responsive_zuriboard/src/contents/utilities/spacing.dart';
import 'package:responsive_zuriboard/src/contents/utilities/responsive.dart';

import '../contents/constants/app_colors.dart';

class IntroHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Jamiu Okanlawon,',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontSize: 18,
                  ),
            ),
            Text('Student Id: ZUR003855P7G'),
            if (Responsive.isMobile(context)) Spacing.mediumHeight(),
            if (Responsive.isMobile(context))
              Directionality(
                textDirection: TextDirection.rtl,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: Text('CHANGE COURSE'),
                  icon: Icon(Icons.book_outlined, size: 16),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.secondaryColor,
                    elevation: 0,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
              )
          ],
        ),
        if (!Responsive.isMobile(context))
          Directionality(
            textDirection: TextDirection.rtl,
            child: ElevatedButton.icon(
              onPressed: () {},
              label: Text('CHANGE COURSE'),
              icon: Icon(Icons.book_outlined, size: 16),
              style: ElevatedButton.styleFrom(
                primary: AppColors.secondaryColor,
                elevation: 0,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
          )
      ],
    );
  }
}
