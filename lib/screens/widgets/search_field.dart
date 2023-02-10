
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_gsg/constant.dart';
import '../../data_layer/surah.dart';
class SearchField extends StatefulWidget {
  static const route="/search";
  final List <Surahs> surah;
  const SearchField({super.key, required this.surah});
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _searchQuery = TextEditingController();
  late List<Surahs> surahList;
  late List _filteredList;
  late List _List;

  @override
  void initState() {
    super.initState();
    surahList=widget.surah;
    print(surahList );
    print("dfghjiyhn");
  }

 /* _filterData(String query) {
    setState(() {
      _filteredList = surahList.where((item) => item['name']
          .toLowerCase()
          .contains(query.toLowerCase()))
          .toList();
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:kMainColor,
        title: TextField(
            textAlign:TextAlign.start,
          textInputAction:TextInputAction.search,
          controller: _searchQuery,
          onChanged: (value) {
            _filterData(_searchQuery.text,_List);
          },
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle:TextStyle(color: kSubTextColor),
              focusColor: kSubTextColor,

          ),
        ),
      ),
      body:ListView.separated(
        separatorBuilder: (BuildContext context, int index) { return Divider(
          color:kSubTextColor,
        ); },
        itemBuilder: (BuildContext context, int index) {
          for (int i = 0; i < surahList[index].ayahs!.length; i++){
            _List.add(surahList[index].ayahs![i].text);
          return Center(child:Text(surahList[index].ayahs![i].text.toString()),);
          //print filterlist
          }
        },
        itemCount: surahList .length,
      )


                        );

          }
  _filterData(String query,list){
    setState(() {
      _filteredList = _List.where((item) => item.contains(query))
          .toList();
    });}

  }




/*void jumpToAyah() {
  if(fabIsClicked){
    itemScrollController.scrollTo(
        index:1,//الاية
        duration:const Duration(seconds:2),
        curve:Curves.easeInCubic
    );
    fabIsClicked=false;
  }
}*/
