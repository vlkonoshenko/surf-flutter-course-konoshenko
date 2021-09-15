import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/redux/action/search_action.dart';
import 'package:places/redux/app_state.dart';
import 'package:places/redux/state/search_state.dart';
import 'package:places/res/icons.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/screen/filter_screen/filters_screen.dart';
import 'package:places/ui/screen/sight_details_screen/sight_details_screen.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/highlighted_text.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/history_state.dart';
import 'package:provider/provider.dart';

import 'widgets/empty_state.dart';

class SightSearchScreen extends StatefulWidget {
  static const String routeName = '/sight_search_screen';

  const SightSearchScreen({Key? key}) : super(key: key);

  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  final FocusNode _fnSearch = FocusNode();
  final TextEditingController _tcSearch = TextEditingController();
  late final SearchInteractor _searchInteractor;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _searchInteractor = context.read<SearchInteractor>();

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
      body: StoreConnector<AppState, SearchState>(
        onInit: (store) => store.dispatch(GetSearchHistoryAction()),
        converter: (store) => store.state.searchState,
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
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
                                  FiltersScreen.routeName,
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
                      ? HistoryState(_searchInteractor)
                      : isLoading
                          ? const CircularProgressIndicator()
                          : _searchInteractor.filteredList.isEmpty
                              ? const EmptyState()
                              : ListView.builder(
                                  itemCount:
                                      _searchInteractor.filteredList.length,
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
                                          arguments: _searchInteractor
                                              .filteredList[index],
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
                                                      BorderRadius.circular(
                                                    8.0,
                                                  ),
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const SizedBox(
                                                          height: 4,
                                                        ),
                                                        HighlightedText(
                                                          text:
                                                              _searchInteractor
                                                                  .filteredList[
                                                                      index]
                                                                  .name,
                                                          matcher:
                                                              _tcSearch.text,
                                                          style: matSubtitle1
                                                              .copyWith(
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        Text(
                                                          _searchInteractor
                                                              .filteredList[
                                                                  index]
                                                              .placeType,
                                                          style: Theme.of(
                                                            context,
                                                          )
                                                              .primaryTextTheme
                                                              .subtitle1!
                                                              .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color:
                                                                    const Color(
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
          );
        },
      ),
    );
  }

  void _listener() {
    setState(() {
      return;
    });
  }

  Future<void> _onChangedSearch(String value) async {
    StoreProvider.of<AppState>(context).dispatch(GetSearchResultAction(
      search: value,
      range: const RangeValues(0, 10000),
    ));
  }
}
