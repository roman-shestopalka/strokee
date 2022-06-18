import 'package:flutter/material.dart';
import 'package:strokee/presentation/features/main/main_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StrokeeApp extends StatelessWidget {
  const StrokeeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Strokee',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('uk', 'UA'), // Ukrainian, no country code
      ],
      // TODO: Add Authorization
      home: MainScreen(),
    );
  }
}
