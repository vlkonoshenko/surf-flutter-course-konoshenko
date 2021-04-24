import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/select_category_screen.dart';
import 'package:places/ui/screen/sight_card.dart';

List<String> history = [];

final List<SightCardMeta> mocks = [
  SightCardMeta(
    Sight(
        'Донбасс арена',
        'https://infodon.org.ua/wp-content/uploads/2019/08/Donbass-Arena-1500x916.jpg',
        Coordinate(48.018330, 37.814148),
        'Футбольный стадион в Донецке, построенный в 2009 году, рассчитан на 52 667 зрителей.',
        SightCategory.specialPlace),
  ),
  SightCardMeta(
    Sight(
        'Парк кованых фигур',
        'https://planetofhotels.com/guide/sites/default/files/styles/paragraph__hero_banner__hb_image__1880bp/public/hero_banner/Park_of_forged_sculptures.jpg',
        Coordinate(48.015881, 37.799938),
        'Парк в Донецке со скульптурными композициями, выкованными из металла. ',
        SightCategory.park),
  ),
  SightCardMeta(
    Sight(
        'Спасо-Преображенский собор',
        'https://www.videnovum.com/foto/ukraine/135/donetsk/spaso-preobrazhensky-sobor/sDSC_0114.JPG',
        Coordinate(48.015881, 37.799938),
        'Собор находится в центре города на центральной улице. Он построен после устновления независимости Украины',
        SightCategory.specialPlace),
  ),
];

final List<SightCardMeta> visit = [
  SightCardMeta(
    Sight(
        'Донбасс арена',
        'https://infodon.org.ua/wp-content/uploads/2019/08/Donbass-Arena-1500x916.jpg',
        Coordinate(48.018330, 37.814148),
        'Футбольный стадион в Донецке, построенный в 2009 году, рассчитан на 52 667 зрителей.',
        SightCategory.specialPlace),
    wantVisit: true,
  ),
  SightCardMeta(
    Sight(
        'Парк кованых фигур',
        'https://planetofhotels.com/guide/sites/default/files/styles/paragraph__hero_banner__hb_image__1880bp/public/hero_banner/Park_of_forged_sculptures.jpg',
        Coordinate(48.015881, 37.799938),
        'Парк в Донецке со скульптурными композициями, выкованными из металла. ',
        SightCategory.park),
    wantVisit: true,
  )
];
