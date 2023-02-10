
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:quran_gsg/business_logic/surah_cubit.dart';
import 'package:quran_gsg/data_layer/surah.dart';
import 'package:quran_gsg/screens/widgets/playAudio.dart';
import 'package:quran_gsg/screens/widgets/search_field.dart';
import '../constant.dart';
import '../helper/component/sliverApp_bar.dart';
import 'surahpage.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

 final ItemScrollController itemScrollController=ItemScrollController();
final ItemPositionsListener  itemPositionsListener= ItemPositionsListener.create();
 bool fabIsClicked=true;

class SurahListScreen extends StatefulWidget {
  const SurahListScreen({Key? key}) : super(key: key);
  static const route="/surah_list";
  @override
  State<SurahListScreen> createState() => _SurahListScreenState();
}

class _SurahListScreenState extends State<SurahListScreen> {
 static List<Surahs> surahList = [];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {jumpToAyah();});
    super.initState();
    BlocProvider.of<SurahCubit>(context).emitFetchSurah();
  }

  @override
  Widget build(BuildContext context) {
    return  NestedScrollView(
      headerSliverBuilder:(context,innerBoxIsScroll) =>[
         KSliverAppBar(text: 'c', fixedText: 'Quran',
           leading:IconButton(
             onPressed: () {
                  showSearch(context: context, delegate:CustomSearch(
                    surahList
                  ));
             }, icon:Icon(Icons.search,color:kSubTextColor,size:24,),

           ),
        )

      ],
      body:Scaffold(
    body:   Stack(
      children: [
        BlocBuilder<SurahCubit,SurahState>(
            builder: (context,state){
                  if(state is FetchSurah){
                    surahList=(state).SurahList;
                        return Expanded(child:
                          ListView.separated(
                          shrinkWrap:true,
                          padding: const EdgeInsets.all(8),
                          itemCount: surahList .length,
                          itemBuilder: (context, index) {
                            int lastAyah =  surahList[index].ayahs!.length - 1;
                            return ListViewItem(surahList: surahList, lastAyah: lastAyah, index: index,);
                          },
                          separatorBuilder: (BuildContext context, index) {
                            return const Divider(
                              thickness: 2,
                            );
                          },
                        ));
                  }
                  else {
                    return Column(
                     crossAxisAlignment:CrossAxisAlignment.center,
                      children: const [
                        Center(child:CircularProgressIndicator(
                          color:   Color(0xff047285),
                        )),
                      ],
                    );
            }
        }
        ),
      ],
    )
      )
    );
  }


  void jumpToAyah() {
    if(fabIsClicked){
      itemScrollController.scrollTo(
          index:1,//الاية
          duration:const Duration(seconds:2),
         curve:Curves.easeInCubic
      );
    fabIsClicked=false;
    }
  }
  saveBookMark(surah,ayah)async{
    final pref=await SharedPreferences.getInstance();
    await pref.setInt("surah",surah);
    await pref.setInt("ayah",ayah);
  }
}

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required this.surahList,
    required this.lastAyah, required this.index,
  });

  final List<Surahs> surahList;
  final int lastAyah;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(2),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) => SurahPage(
                      pageNum:index,surahList:surahList
                  )),
            );
          },
            child: Hero(
              tag: surahList[index].number!,
              child: Row(
                children: [
                  Expanded(child: leftWidgets(),),
                  Expanded(child: rightWidgets(),),
                ],
              ),
            ),
           ));
  }
  Row rightWidgets() {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${surahList[index].name}",
                      style: kMainTextStyle.copyWith(
                        color:  const Color(0xff047285),
                      ),

                    ),
                  ],
                );
  }
  Row leftWidgets() {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PlayAudio(ayaAduioNum:index,),
                    Container(
                      height: 40,
                      width:
                      (surahList[index].revelationType =="Meccan")
                          ? 50
                          : 65,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: (
                                  surahList[index].revelationType =="Meccan"
                              )
                                  ? const AssetImage(
                                'assets/images/makka.jpg',
                              )
                                  : const AssetImage(
                                'assets/images/masjid.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                    Column(
                      children: [
                        Text("آياتها", style: ksubTextStyle),
                        Text(
                          '${surahList[index].ayahs!.length}',
                          style: ksubTextStyle,
                        ),
                      ],
                    ),
                  ],
                );
  }
}


class CustomSearch extends SearchDelegate
{
  final List _list;
  CustomSearch(this._list);
  @override
  List<Widget>? buildActions(BuildContext context) {
    print(_list);
    return [
      IconButton(onPressed: (){
        query='';
      }, icon:Icon(Icons.clear,color:kSubTextColor)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return
      IconButton(onPressed: (){
        close(context,null);
      }, icon:Icon(Icons.arrow_back,color:kSubTextColor,));

  }

  @override
  Widget buildResults(BuildContext context) {
     List matchQuery=[];
     for(var item in _list){
       if(item.contains(query)){
         matchQuery.add(query);
       }else return Center(child:CircularProgressIndicator(),);
     }
     return  Expanded(child:ListView.builder(
       shrinkWrap: true,
       itemCount: matchQuery.length,
       itemBuilder: (BuildContext context, int index) {
         return ListTile(
             title:Text(matchQuery[index],   textAlign:TextAlign.end,),);
       },
     )
     );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    return Expanded(child:ListView.separated(
      shrinkWrap: true,
      itemCount:  _list.length,
      itemBuilder: (BuildContext context, int index)
    {
      for (var item in _list[index].ayahs) {
        return ListTile(
            title: Text(item.text.toString(),
            textAlign:TextAlign.end,
            ));
    }
      },
      separatorBuilder: (BuildContext context, int index) { return Divider();},
    ),
    );
  }
  
}