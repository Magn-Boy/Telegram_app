import 'package:flutter/material.dart';
import 'package:telegram_web_app/telegram_web_app.dart';

import 'screens/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegram App Test',
      theme: TelegramThemeUtil.getTheme(TelegramWebApp.instance),
      home: const MainScreen(),
    );
  }
}
