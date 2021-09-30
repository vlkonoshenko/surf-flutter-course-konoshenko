import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/app/app_builder.dart';
import 'package:places/redux/app_state.dart';
import 'package:places/redux/setting/setting_action.dart';
import 'package:places/redux/setting/setting_state.dart';
import 'package:places/res/icons.dart';
import 'package:places/service/shared_preference.dart';
import 'package:places/ui/screen/onboarding_screen/onboarding_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

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
              .subtitle1!
              .copyWith(fontSize: 18),
        ),
      ),
      body: StoreConnector<AppState, SettingState>(
        converter: (store) => store.state.settingState,
        builder: (context, state) {
          return Padding(
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
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    CupertinoSwitch(
                      value: state.isDarkMode,
                      onChanged: (onChanged) async{
                        await SharedPreference.setTheme(onChanged).then((value){
                          StoreProvider.of<AppState>(context)
                              .dispatch(SwitchThemeAction(onChanged));
                          AppBuilder.of(context).rebuild();
                        });

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
                            .subtitle1!
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
                          return;
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
