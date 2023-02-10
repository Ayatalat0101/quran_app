

import 'package:quran_gsg/data_layer/surah.dart';
import 'package:quran_gsg/data_layer/web_services.dart';

class SurahRespository {
  final SurahWebService surahWebService;

  SurahRespository(this.surahWebService);

  Future<List<Surahs>> FetchSurah() async {
    var response = await surahWebService.FetchSurah();
    print(response);
    return response.data!.surahs!.map((surah) =>
        Surahs.fromJson(surah.toJson())).toList();
  }

}
