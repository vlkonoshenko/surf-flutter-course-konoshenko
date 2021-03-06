import 'package:flutter/material.dart';
import 'package:places/ui/components/search_bar.dart';

class AppHeaderLandscapeDelegat extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 160.0;

  @override
  double get minExtent => 50.0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return LayoutBuilder(builder: (context, constraints) {
      final percentage =
          (constraints.maxHeight - minExtent) / (maxExtent - minExtent);

      return Container(
        color: Colors.white,
        height: constraints.maxHeight,
        padding: const EdgeInsets.only(bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              reverseDuration: const Duration(milliseconds: 100),
              child: percentage < 0.9
                  ? Text(
                      'Список интересных мест',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .subtitle1!
                          .copyWith(fontSize: 14),
                    )
                  : const SizedBox(),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              child: percentage > 0.9
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Text(
                            'Список интересных мест',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .subtitle1!
                                .copyWith(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              child: percentage > 0.8 ? const SearchBar() : const SizedBox(),
            ),
          ],
        ),
      );
    });
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
