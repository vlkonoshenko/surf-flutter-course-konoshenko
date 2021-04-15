import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/mocks.dart';
import 'package:places/res/icons.dart';
import 'package:places/res/res.dart';
import 'package:places/res/text_style.dart';
import 'package:places/ui/components/label_text_widget.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_details_screen.dart';
import 'package:styled_text/styled_text.dart';
import 'select_category_screen.dart';

import 'filters_screen.dart';

class SightSearchScreen extends StatefulWidget {
  static const String routeName = '/sight_search_screen';

  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  FocusNode _fnSearch = FocusNode();
  TextEditingController _tcSearch = TextEditingController();
  List<SightCardMeta> result = [];

  bool isLoading = false;

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
                    child: TextField(
                      textInputAction: TextInputAction.search,
                      controller: _tcSearch,
                      focusNode: _fnSearch,
                      onSubmitted: (value) {
                        history.add(value);
                        FocusManager.instance.primaryFocus.unfocus();
                      },
                      onChanged: _onChangedSearch,
                      maxLines: 1,
                      cursorWidth: 1,
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
                              _onChangedSearch('');
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
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 400),
                child: _tcSearch.text.isEmpty
                    ? _buildHistoryState()
                    : isLoading
                        ? CircularProgressIndicator()
                        : result.isEmpty
                            ? _buildEmptyState()
                            : _buildResultState(),
              ),
            )
          ],
        ));
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          iconSearch,
          color: Color(0xff7C7E92).withOpacity(0.54),
          width: 50,
          height: 50,
        ),
        SizedBox(
          height: 32,
        ),
        Text('Ничего не найдено.',
            style: Theme.of(context)
                .primaryTextTheme
                .caption
                .copyWith(fontSize: 18)),
        SizedBox(
          height: 8,
        ),
        Text(
          'Попробуйте изменить параметры поиска',
          style: Theme.of(context).primaryTextTheme.caption,
        ),
      ],
    );
  }

  Widget _buildResultState() {
    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            history.add(result[index].sight.name);
            Navigator.pushNamed(context, SightDetailsScreen.routeName,
                arguments: result[index]);
          },
          child: Container(
            padding: EdgeInsets.only(top: 16),
            height: 80,
            child: Row(
              children: [
                SizedBox(
                  width: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        result[index].sight.url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 4,
                            ),
                            _buildTitle(
                              context,
                              result[index].sight.name,
                              _tcSearch.text,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              result[index].sight.type.toText(),
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .subtitle1
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff7C7E92)),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitle(BuildContext context, String word, String part) {
    var resultStr = word.replaceAll(part, "<bold>$part</bold>");
    return StyledText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: resultStr,
      style: Theme.of(context).primaryTextTheme.subtitle1,
      styles: {
        'bold': Theme.of(context)
            .primaryTextTheme
            .subtitle1
            .copyWith(fontWeight: FontWeight.bold),
      },
    );
  }

  void _onChangedSearch(String value) async {
    setState(() {
      isLoading = true;
    });
    var founded = mocks
        .where((element) =>
            element.sight.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      result = founded;
      isLoading = false;
    });
  }

  Widget _buildHistoryState() {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            LabelWidget(
                history.isNotEmpty ? 'Вы искали' : 'История поиска пуста'),
            SizedBox(height: 10),
            ListView.builder(
                itemCount: history.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            history[index],
                            style: Theme.of(context)
                                .primaryTextTheme
                                .subtitle1
                                .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff7C7E92)),
                          )),
                          IconButton(
                              icon: SvgPicture.asset(
                                iconClose,
                                color: Color(0xff7C7E92),
                                width: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  history.removeAt(index);
                                });
                              }),
                        ],
                      ),
                      if (index != history.length - 1) Divider()
                    ],
                  );
                }),
            SizedBox(height: 24),
            InkWell(
              onTap: () {
                setState(() {
                  history.clear();
                });
              },
              child: history.isNotEmpty
                  ? Text(
                      'Очистить историю',
                      style: textMedium.copyWith(color: lmGreenColor),
                    )
                  : SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }
}
