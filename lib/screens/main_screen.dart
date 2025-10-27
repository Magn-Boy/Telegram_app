import 'package:flutter/material.dart';
import 'package:telegram_app/screens/%D1%81loud_storage_screen.dart';
import 'package:telegram_app/screens/settings_button_screen.dart';
import 'package:telegram_web_app/telegram_web_app.dart';

import '../components/color_picker_dialog.dart';
import '../extensions/string_snackbar_extension.dart';
import '../widgets/info_expandable_tile.dart';
import '../widgets/info_expandable_tile_with_widget.dart';
import '../widgets/list_button.dart';
import '../widgets/one_color_expandable_tile.dart';
import '../widgets/theme_param_widget.dart';
import 'back_button_screen.dart';
import 'haptic_feedback_screen.dart';
import 'main_button_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TelegramWebApp telegram = TelegramWebApp.instance;

  bool? isDefinedVersion;

  @override
  void initState() {
    super.initState();
    telegram.ready();
    _checkVersion();
  }

  Future<void> _checkVersion() async {
    await Future.delayed(const Duration(seconds: 2));
    isDefinedVersion = await telegram.isVersionAtLeast('Bot API 6.1');
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: telegram.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ListButton('Expand', onPress: telegram.expand),
          InfoExpandableTile('Init Data', telegram.initData.toString()),
          InfoExpandableTile(
            'Init Data Unsafe',
            telegram.initDataUnsafe?.toReadableString() ?? 'null',
          ),
          InfoExpandableTile('Version', telegram.version),
          InfoExpandableTile('Platform', telegram.platform),
          InfoExpandableTile('Color Scheme', telegram.colorScheme.name),
          ThemeParamsWidget(telegram.themeParams),
          InfoExpandableTile('isExpanded', telegram.isExpanded.toString()),
          InfoExpandableTile(
            'viewportHeight',
            telegram.viewportHeight.toString(),
          ),
          InfoExpandableTile(
            'viewportStableHeight',
            telegram.viewportStableHeight.toString(),
          ),
          OneColorExpandableTile('headerColor', telegram.headerColor),
          OneColorExpandableTile('backgroundColor', telegram.backgroundColor),

          InfoExpandableTileWithWidget(
            'Closing confirmation',
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('isClosingConfirmationEnabled'),
                  const SizedBox(height: 8),
                  Text(
                    telegram.isClosingConfirmationEnabled.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          telegram.enableClosingConfirmation();
                          if (mounted) setState(() {});
                        },
                        child: const Text('Enable'),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          telegram.disableClosingConfirmation();
                          if (mounted) setState(() {});
                        },
                        child: const Text('Disable'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            initiallyExpanded: false,
          ),

          ListButton(
            'BackButton',
            onPress: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const BackButtonScreen(),
                ),
              );
            },
          ),
          ListButton(
            'MainButton',
            onPress: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MainButtonScreen(),
                ),
              );
            },
          ),
          ListButton(
            'SettingsButton',
            onPress: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SettingsButtonScreen(),
                ),
              );
            },
          ),
          ListButton(
            'HapticFeedback',
            onPress: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HapticFeedbackScreen(),
                ),
              );
            },
          ),
          ListButton(
            'CloudStorage',
            onPress: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CloudStorageScreen(),
                ),
              );
            },
          ),

          InfoExpandableTile(
            'isVersionAtLeast(6.1)',
            isDefinedVersion.toString(),
          ),

          ListButton(
            'setHeaderColor(color)',
            onPress: () async {
              final color = await selectColor(context);
              if (color != null) {
                telegram.setHeaderColor(color);
                'Setting color: ${color.hexString}'.showSnackbar(context);
                await Future.delayed(const Duration(seconds: 2));
                if (mounted) setState(() {});
              } else {
                'Selected color is null'.showSnackbar(context);
              }
            },
          ),
          ListButton(
            'setBackgroundColor(color)',
            onPress: () async {
              final color = await selectColor(context);
              if (color != null) {
                telegram.setBackgroundColor(color);
                'Setting color: ${color.hexString}'.showSnackbar(context);
                await Future.delayed(const Duration(seconds: 2));
                if (mounted) setState(() {});
              } else {
                'Selected color is null'.showSnackbar(context);
              }
            },
          ),

          ListButton(
            'Open link',
            onPress: () {
              telegram.openLink(
                'https://telegram.org/blog/new-saved-messages-and-9-more',
                tryInstantView: true,
              );
            },
          ),
          ListButton(
            'Open telegram link',
            onPress: () {
              telegram.openTelegramLink('https://t.me/flutter_telegram');
            },
          ),

          ListButton(
            'Show pop',
            onPress: () async {
              try {
                telegram.showPopup(
                  title: 'Title',
                  message: "Message",
                  buttons: [
                    PopupButton.defaultType('default', 'Yes'),
                    PopupButton.cancel('cancel'),
                  ],
                  callback: (String id) {
                    'Button pressed. Id: $id'.showSnackbar(context);
                  },
                );
              } catch (ex) {
                'error happened showing popup: $ex'.showSnackbar(context);
              }
            },
          ),
          ListButton(
            'Show alert',
            onPress: () async {
              try {
                telegram.showAlert('Sample Alert', () {
                  'Alert closed'.showSnackbar(context);
                });
              } catch (ex) {
                'error happened showing alert: $ex'.showSnackbar(context);
              }
            },
          ),
          ListButton(
            'Show confirm',
            onPress: () async {
              try {
                telegram.showConfirm('Sample Confirm', (okPressed) {
                  'Confirm closed. Ok pressed: $okPressed'.showSnackbar(
                    context,
                  );
                });
              } catch (ex) {
                'error happened showing alert: $ex'.showSnackbar(context);
              }
            },
          ),
          ListButton(
            'Show scan QR',
            onPress: () async {
              try {
                telegram.showScanQrPopup('Sample Confirm', (result) {
                  'Got QR: $result'.showSnackbar(context);
                  return false;
                });
              } catch (ex) {
                'error happened showing alert: $ex'.showSnackbar(context);
              }
            },
          ),
          ListButton(
            'Read clipboard',
            onPress: () {
              telegram.readTextFromClipboard((result) {
                'Clipboard text: $result. Call allowed only by MainButton'
                    .showSnackbar(context);
              });
            },
          ),
          ListButton(
            'Request write access',
            onPress: () {
              telegram.requestWriteAccess(
                onResult: (result) =>
                    'Write access granted: $result'.showSnackbar(context),
              );
            },
          ),
          ListButton(
            'Request Contact',
            onPress: () {
              telegram.requestContact(
                (result) => 'Contact granted: $result'.showSnackbar(context),
              );
            },
          ),
          ListButton(
            'Switch inline query',
            onPress: () => telegram.switchInlineQuery('Hello Telegram'),
          ),
          ListButton(
            'sendData',
            onPress: () =>
                telegram.sendData('Hello this message is from mini app'),
          ),
          ListButton('Ready', onPress: telegram.ready),
          ListButton('Close', onPress: telegram.close),
        ],
      ),
    );
  }
}
