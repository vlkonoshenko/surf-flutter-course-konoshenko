import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/res/icons.dart';

import 'add_sight_screen.dart';
import 'filters_screen.dart';

class SightSearchScreen extends StatefulWidget {
  static const String routeName = '/sight_search_screen';

  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  FocusNode _fnSearch = FocusNode();
  TextEditingController _tcSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fnSearch.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            "Список интересных мест",
            style: Theme.of(context)
                .primaryTextTheme
                .subtitle1
                .copyWith(fontSize: 18),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Stack(
                alignment: Alignment.centerRight,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      controller: _tcSearch,
                      focusNode: _fnSearch,
                      maxLines: 1,
                      cursorWidth: 1,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        filled: true,
                        isDense: true,
                        hintText: 'Поиск',
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xff7C7E92).withOpacity(0.54)),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(6),
                          child: SvgPicture.asset(
                            iconSearch,
                            color: Color(0xff7C7E92).withOpacity(0.54),
                          ),
                        ),
                        fillColor: const Color(0x128e8e93),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: _fnSearch.hasFocus
                        ? IconButton(
                        icon: SvgPicture.asset(iconClear,
                            color: Theme.of(context).primaryColor),
                        onPressed: () {
                          _tcSearch.clear();
                        })
                        : IconButton(
                            icon: SvgPicture.asset(iconFilter,
                                color: Theme.of(context).accentColor),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, FilterScreen.routeName);
                            }),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
