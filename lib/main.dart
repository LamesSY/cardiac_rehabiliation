import 'package:cardiac_rehabilitation/constants.dart';
import 'package:cardiac_rehabilitation/logic/dashboard_controller.dart';
import 'package:cardiac_rehabilitation/logic/menu_controller.dart';
import 'package:cardiac_rehabilitation/pages/page_main.dart';
import 'package:cardiac_rehabilitation/routes/route_manage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('zh', 'CH'), Locale('en', 'US')],
      title: 'Material App',
      initialRoute: Routes.managerManage,
      getPages: Routes.pages,
      builder: (context, child) {
        return MainPage(child);
      },
      // home: MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider(create: (context) => MenuController()),
      //     ChangeNotifierProvider(create: (context) => DashboardController()),
      //   ],
      //   child: const MainPage(),
      // ),
    );
  }
}
