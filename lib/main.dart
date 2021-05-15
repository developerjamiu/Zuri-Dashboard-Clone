import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'src/contents/constants/app_colors.dart';
import 'src/controllers/menu_controller.dart';
import 'src/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final iconThemeData = IconThemeData(color: AppColors.onSurfaceColor);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zuriboard',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: AppColors.onSurfaceColor,
        ),
        canvasColor: AppColors.surfaceColor,
        iconTheme: iconThemeData,
        appBarTheme: AppBarTheme(iconTheme: iconThemeData),
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
        ],
        child: HomeView(),
      ),
    );
  }
}
