import 'package:flutter/material.dart';
import 'package:telegram_web_app/telegram_web_app.dart';

import 'app.dart';

void main() async {
  try {
    if (TelegramWebApp.instance.isSupported) {
      TelegramWebApp.instance.ready();
      Future.delayed(
        const Duration(seconds: 1),
        TelegramWebApp.instance.expand,
      );
    }
  } catch (e) {
    print("Error happened in Flutter while loading Telegram $e");
    // add delay for 'Telegram seldom not loading' bug
    await Future.delayed(const Duration(milliseconds: 200));
    main();
    return;
  }

  FlutterError.onError = (details) {
    print("Flutter error happened: $details");
  };

  runApp(const MyApp());
}
