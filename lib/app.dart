import 'package:flutter/material.dart';

import 'core/app_theme.dart';
import 'core/localized_text.dart';
import 'screens/app_shell.dart';

class AivoraApp extends StatefulWidget {
  const AivoraApp({super.key});

  @override
  State<AivoraApp> createState() => _AivoraAppState();
}

class _AivoraAppState extends State<AivoraApp> {
  AppLanguage _language = AppLanguage.english;

  void _toggleLanguage() {
    setState(() {
      _language = _language == AppLanguage.english
          ? AppLanguage.arabic
          : AppLanguage.english;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aivora',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: Directionality(
        textDirection: _language.isArabic
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: AppShell(language: _language, onToggleLanguage: _toggleLanguage),
      ),
    );
  }
}
