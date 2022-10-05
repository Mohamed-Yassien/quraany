import 'local/cache_helper.dart';

String langCode = CacheHelper.getData(key: 'lang') ?? 'en';

String GET_QURAN_SURAH(String lang) => 'surah/3/$lang.asad';

