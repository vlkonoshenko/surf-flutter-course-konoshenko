import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/select_category_screen.dart';
import 'package:places/ui/screen/sight_card.dart';

List<String> history = [];

final List<SightCardMeta> mocks = [
  SightCardMeta(
    Sight(
        'Donbass arena',
        'https://infodon.org.ua/wp-content/uploads/2019/08/Donbass-Arena-1500x916.jpg',
        Coordinate(48.018330, 37.814148),
        'Футбольный стадион в Донецке, построенный в 2009 году, рассчитан на 52 667 зрителей.',
        SightCategory.special_place),
  ),
  SightCardMeta(
    Sight(
        'A park of forged figures with a long title to showcase the second row',
        'https://lh3.googleusercontent.com/proxy/L10i5lEDvQj1J0M_hgdtwG0cSTLFOWu35zBd4pmR9J-wAEHcC4nvKnTvaxYINS54pcBEoeEGvZk2A6AfE_50X4QXZv2xVlvzNCuzSVLU4oASjw0tgsKxyoe1sg',
        Coordinate(48.015881, 37.799938),
        'Парк в Донецке со скульптурными композициями, выкованными из металла. ',
        SightCategory.park),
  )
];

final List<SightCardMeta> visit = [
  SightCardMeta(
    Sight(
        'Donbass arena 2',
        'https://infodon.org.ua/wp-content/uploads/2019/08/Donbass-Arena-1500x916.jpg',
        Coordinate(48.018330, 37.814148),
        'Футбольный стадион в Донецке, построенный в 2009 году, рассчитан на 52 667 зрителей.',
        SightCategory.special_place),
    wantVisit: true,
  ),
  SightCardMeta(
    Sight(
        '2 A park of forged figures with a long title to showcase the second row',
        'https://lh3.googleusercontent.com/proxy/L10i5lEDvQj1J0M_hgdtwG0cSTLFOWu35zBd4pmR9J-wAEHcC4nvKnTvaxYINS54pcBEoeEGvZk2A6AfE_50X4QXZv2xVlvzNCuzSVLU4oASjw0tgsKxyoe1sg',
        Coordinate(48.015881, 37.799938),
        'Парк в Донецке со скульптурными композициями, выкованными из металла. ',
        SightCategory.park),
    wantVisit: true,
  ),
  SightCardMeta(
    Sight(
        'Donbass arena',
        'https://infodon.org.ua/wp-content/uploads/2019/08/Donbass-Arena-1500x916.jpg',
        Coordinate(48.018330, 37.814148),
        'Футбольный стадион в Донецке, построенный в 2009 году, рассчитан на 52 667 зрителей.',
        SightCategory.special_place),
    wantVisit: true,
  ),
  SightCardMeta(
    Sight(
        'A park of forged figures with a long title to showcase the second row',
        'https://lh3.googleusercontent.com/proxy/L10i5lEDvQj1J0M_hgdtwG0cSTLFOWu35zBd4pmR9J-wAEHcC4nvKnTvaxYINS54pcBEoeEGvZk2A6AfE_50X4QXZv2xVlvzNCuzSVLU4oASjw0tgsKxyoe1sg',
        Coordinate(48.015881, 37.799938),
        'Парк в Донецке со скульптурными композициями, выкованными из металла. ',
        SightCategory.park),
    wantVisit: true,
  )
];
