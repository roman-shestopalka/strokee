import 'package:flutter/material.dart';
import 'package:strokee/presentation/features/main/main_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StrokeeApp extends StatelessWidget {
  const StrokeeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      title: 'Strokee',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('uk', 'UA'), // Ukrainian, no country code
      ],
      // TODO: Add Authorization
      home: const MainScreen(),
    );
  }
}
