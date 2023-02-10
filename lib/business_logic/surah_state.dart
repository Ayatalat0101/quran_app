part of 'surah_cubit.dart';

@immutable
abstract class SurahState {}

class SurahInitial extends SurahState {}
class FetchSurah extends SurahState {
  final List<Surahs> SurahList;
  FetchSurah(this.SurahList);

}
