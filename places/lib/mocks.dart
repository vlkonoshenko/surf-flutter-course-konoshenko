import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_card.dart';

List<String> history = [];

final List<SightCardMeta> mocks = [
  SightCardMeta(
    Sight(
        'Donbass arena',
        'https://infodon.org.ua/wp-content/uploads/2019/08/Donbass-Arena-1500x916.jpg',
        Coordinate(48.018330, 37.814148),
        'Футбольный стадион в Донецке, построенный в 2009 году, рассчитан на 52 667 зрителей.',
        'Стадион'),
  ),
  SightCardMeta(
    Sight(
        'A park of forged figures with a long title to showcase the second row',
        'https://prodonbass.ru/wp-content/uploads/2020/09/22-24.jpg',
        Coordinate(48.015881, 37.799938),
        'Парк в Донецке со скульптурными композициями, выкованными из металла. ',
        'Парк'),
  )

];
