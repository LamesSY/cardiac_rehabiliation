import 'package:cardiac_rehabilitation/pages/page_main.dart';
import 'package:cardiac_rehabilitation/routes/route_manage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          textTheme: GoogleFonts.mateTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black),
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const [Locale('zh', 'CH'), Locale('en', 'US')],
        title: 'Material App',
        initialRoute: Routes.patientManage,
        defaultTransition: Transition.fadeIn,
        getPages: Routes.pages,
        builder: (_, child) {
          return MainPage(child);
        });
  }
}
