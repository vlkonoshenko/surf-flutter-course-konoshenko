import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/res/icons.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/sight_details_screen.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/history_state.dart';
import 'package:styled_text/styled_text.dart';

class SightSearchScreen extends StatefulWidget {
  static const String routeName = '/sight_search_screen';

  const SightSearchScreen({Key? key}) : super(key: key);

  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  final FocusNode _fnSearch = FocusNode();
  final TextEditingController _tcSearch = TextEditingController();
  final _searchInteractor = SearchInteractor();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _fnSearch.addListener(_listener);
  }

  @override
  void dispose() {
    _fnSearch.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            iconArrow,
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Список интересных мест',
          style: Theme.of(context)
              .primaryTextTheme
              .subtitle1!
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
                      _searchInteractor.history.add(value);
                      FocusManager.instance.primaryFocus!.unfocus();
                    },
                    onChanged: _onChangedSearch,
                    cursorWidth: 1,
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
                  duration: const Duration(milliseconds: 300),
                  child: _fnSearch.hasFocus
                      ? IconButton(
                          icon: SvgPicture.asset(
                            iconClear,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {
                            _tcSearch.clear();
                            _onChangedSearch('');
                          },
                        )
                      : IconButton(
                          icon: SvgPicture.asset(
                            iconFilter,
                            color: Theme.of(context).accentColor,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              FilterScreen.routeName,
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: _tcSearch.text.isEmpty
                  ? HistoreyStateWidget(_searchInteractor)
                  : isLoading
                      ? const CircularProgressIndicator()
                      : _searchInteractor.filteredList.isEmpty
                          ? const EmptyState()
                          : ListView.builder(
                              itemCount: _searchInteractor.filteredList.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    _searchInteractor.history.add(
                                      _searchInteractor
                                          .filteredList[index].name,
                                    );
                                    Navigator.pushNamed(
                                      context,
                                      SightDetailsScreen.routeName,
                                      arguments:
                                          _searchInteractor.filteredList[index],
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 16),
                                    height: 80,
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 16),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 8.0,
                                          ),
                                          child: AspectRatio(
                                            aspectRatio: 1,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                _searchInteractor
                                                    .filteredList[index]
                                                    .urls
                                                    .first,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(height: 4),
                                                    TitleWidget(
                                                      _searchInteractor
                                                          .filteredList[index]
                                                          .name,
                                                      _tcSearch.text,
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      _searchInteractor
                                                          .filteredList[index]
                                                          .placeType,
                                                      style: Theme.of(context)
                                                          .primaryTextTheme
                                                          .subtitle1!
                                                          .copyWith(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                              0xff7C7E92,
                                                            ),
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Divider(height: 1),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
            ),
          ),
        ],
      ),
    );
  }

  void _listener() {
    setState(() {
      return;
    });
  }

  Future<void> _onChangedSearch(String value) async {
    setState(() {
      isLoading = true;
    });

    await Future<void>.delayed(const Duration(seconds: 1));
    setState(() async {
      await _searchInteractor
          .searchPlaces(value, const RangeValues(0, 10000), []);
      isLoading = false;
    });
  }
}

class EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          iconSearch,
          color: const Color(0xff7C7E92).withOpacity(0.54),
          width: 50,
          height: 50,
        ),
        const SizedBox(height: 32),
        Text(
          'Ничего не найдено.',
          style: Theme.of(context)
              .primaryTextTheme
              .caption!
              .copyWith(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Text(
          'Попробуйте изменить параметры поиска',
          style: Theme.of(context).primaryTextTheme.caption,
        ),
      ],
    );
  }
}

class TitleWidget extends StatelessWidget {
  final String part;
  final String word;

  const TitleWidget(this.word, this.part, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resultStr = word.replaceAll(part, '<bold>$part</bold>');

    final tag = StyledTextTag(
      style: Theme.of(context)
          .primaryTextTheme
          .subtitle1!
          .copyWith(fontWeight: FontWeight.bold),
    );

    return StyledText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: resultStr,
      style: Theme.of(context).primaryTextTheme.subtitle1,
      tags: {'bold': tag},
    );
  }
}
