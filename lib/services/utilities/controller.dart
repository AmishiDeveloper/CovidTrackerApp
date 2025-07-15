import 'package:covid19_tracker_app/model/world_stats_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../stats_services.dart';

class  Controller extends GetxController
{

  //properties
  Rx<TextEditingController> searchController=TextEditingController().obs;
  Rx<WorldStatsModel>worldstatslist=WorldStatsModel().obs;
  Rx<bool> isLoading=true.obs;
  StatsServices services=StatsServices();
  RxList countries_list=[].obs;
  List c_list=[];


  //functions

  //setting up the world stats record in the world stats model
  void putWorldStatsRec(WorldStatsModel data)
  {
    worldstatslist.value=data;
  }

  void worldStatsApi()
  {
    services.getWorldStatsRec().then((value){
      putWorldStatsRec(value);
      isLoading.value=false;
    });
  }

  // String UpdateTextEditingController(value) {
  //   if (searchController.value.text != value) {
  //     searchController.value.text = value;
  //   }
  //   return searchController.value.text;
  // }


  void putCountriesList(List l1)
  {
    countries_list.value=l1;
    c_list=countries_list;
  }

  void countriesApi()
  {
    services.getCountriesList().then((value){
      putCountriesList(value);
      //isLoading.value=false;
    });
  }

  final foundCountries=[].obs;

  @override
  void onInit(){
    foundCountries.value=countries_list;
  }

  void filterCountries(String countryName)
  {
    List results=[] ;
    if(countryName.isEmpty)//MEANS IF TEXTFIELDS ONCHANCHED VALUE IS EMPTY IE NOTHING IN TEXTFIELD
      {
        results=c_list;//IF TEXTFIELD IS EMPTY THEN ALL THE COUHNTRIES LIST WE GOT FROM API SHOULD BE DISPLAYED
       // results=foundCountries;
      }
    else{//NOTE WE HAVE DIFF MAPS OBJ IN LIST SO LIST OF MAPS NOW ONLY LIST OF THOSE COUNTRIES WHOSE NAME MATCHES WITH THE TEXT OF TEXTFIELD
       results=c_list.where((element)=>element["country"].toString().toLowerCase().contains(countryName.toLowerCase())).toList();
      //results=countries_list.where((element)=>element["country"].toString().toLowerCase().contains(countryName.toLowerCase())).toList();

    }
    foundCountries.value=results;
  }

}