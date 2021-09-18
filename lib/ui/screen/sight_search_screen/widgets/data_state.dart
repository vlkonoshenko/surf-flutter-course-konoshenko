import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/screen/sight_details_screen/sight_details_screen.dart';

import 'highlighted_text.dart';

class DataState extends StatelessWidget {
  final SearchInteractor searchInteractor;
  final TextEditingController textEditingController;

  const DataState({
    Key? key,
    required this.searchInteractor,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searchInteractor.filteredList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            searchInteractor.history.add(
              searchInteractor.filteredList[index].name,
            );
            Navigator.pushNamed(
              context,
              SightDetailsScreen.routeName,
              arguments: searchInteractor.filteredList[index],
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
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                      child: Image.network(
                        searchInteractor.filteredList[index].urls.first,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 4,
                            ),
                            HighlightedText(
                              text: searchInteractor.filteredList[index].name,
                              matcher: textEditingController.text,
                              style: matSubtitle1.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              searchInteractor.filteredList[index].placeType,
                              style: Theme.of(
                                context,
                              ).primaryTextTheme.subtitle1!.copyWith(
                                    fontWeight: FontWeight.w400,
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
    );
  }
}
