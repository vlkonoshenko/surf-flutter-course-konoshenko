import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/main.dart';
import 'package:places/res/icons.dart';
import 'package:places/ui/screen/onboarding_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Настройки',
          style: Theme.of(context)
              .primaryTextTheme
              .subtitle1
              .copyWith(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Тёмная тема',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                CupertinoSwitch(
                  value: isDarkMode,
                  onChanged: (onChanged) {
                    themeNotifier.notifyListeners();
                  },
                ),
              ],
            ),
            const Divider(),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(OnboardingScreen.routeName);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Смотреть туториал',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .subtitle1
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      iconInfo,
                      color: Theme.of(context).accentColor,
                    ),
                    onPressed: () async {
                      // final data =
                      //     await PlaceRepository(ApiClient().createDio())
                      //         .getPlaceList();
                      // print(data);
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
