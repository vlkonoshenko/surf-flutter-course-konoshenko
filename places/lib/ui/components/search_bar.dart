import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/screen/filter_screen/filters_screen.dart';
import 'package:places/ui/screen/sight_search_screen/sight_search_screen.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    onTap: () {
                      Navigator.pushNamed(context, SightSearchScreen.routeName);
                    },
                    readOnly: true,
                    cursorWidth: 1,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      hintText: 'Поиск',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: const Color(0xff7C7E92).withOpacity(0.54),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(6),
                        child: SvgPicture.asset(
                          iconSearch,
                          color: const Color(0xff7C7E92).withOpacity(0.54),
                        ),
                      ),
                      fillColor: const Color(0x128e8e93),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    iconFilter,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, FiltersScreen.routeName);
                  },
                ),
              ],
            ),
          ),
        ],
      );
}
