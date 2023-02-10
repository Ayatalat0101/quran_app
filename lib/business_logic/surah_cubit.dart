import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data_layer/surah.dart';
import '../data_layer/surah_repository.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  final  SurahRespository surahRespository;
  SurahCubit(this.surahRespository) : super(SurahInitial());
  void emitFetchSurah(){
    surahRespository.FetchSurah().then(
            (surahList){
              emit(FetchSurah(surahList));
            }
    );
  }

}
