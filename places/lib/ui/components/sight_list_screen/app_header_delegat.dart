import 'package:flutter/material.dart';
import 'package:places/ui/components/search_bar.dart';

class AppHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return LayoutBuilder(builder: (context, constraints) {
      final double percentage =
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
              child: percentage < 0.4
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
              child: percentage > 0.95
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Text(
                            'Список \nинтересных мест',
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
  double get maxExtent => 230.0;

  @override
  double get minExtent => 30.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
