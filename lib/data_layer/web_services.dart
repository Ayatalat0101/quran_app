
import 'package:quran_gsg/data_layer/surah.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'web_services.g.dart';
@RestApi(baseUrl: "http://api.alquran.cloud/v1/quran/")
abstract class SurahWebService {
  factory SurahWebService(Dio dio, {String baseUrl})=_SurahWebService;
  @GET("quran-uthmani")
  Future<SurahData>FetchSurah();
}