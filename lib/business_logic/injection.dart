

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quran_gsg/business_logic/surah_cubit.dart';
import 'package:quran_gsg/data_layer/surah_repository.dart';
import 'package:quran_gsg/data_layer/web_services.dart';

final getIt = GetIt.instance;

void  InitGetIt() {
  getIt.registerLazySingleton<SurahCubit>(() =>SurahCubit(getIt()));
  getIt.registerLazySingleton<SurahRespository>(() =>SurahRespository(getIt()));
  getIt.registerLazySingleton<SurahWebService>(() =>SurahWebService(CreateAndSetDio()));

}
Dio CreateAndSetDio(){
  Dio dio=Dio();
  dio.interceptors.add(
      LogInterceptor(
        requestBody:true,
        error: true,
        requestHeader:true,
        responseHeader:true,
        request:true,
        responseBody:true,
      )
  );
  return dio;
}