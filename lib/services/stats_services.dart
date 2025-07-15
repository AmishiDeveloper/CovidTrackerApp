import 'dart:convert';
import 'package:covid19_tracker_app/model/world_stats_model.dart';
import 'package:covid19_tracker_app/services/utilities/app_urls.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;//used to fetch data from api

class StatsServices
{
//now we have to call the api it will fetch the data from the services and display it on the ui
  Future<WorldStatsModel> getWorldStatsRec() async
  {
    http.Response response = await http.get(Uri.parse(AppUrl.worldStatsApi));
    //var data=jsonDecode(response.body.toString());

    if(response.statusCode == 200)
      {
        //if statuscode is 200 then we have to store the data in the worldstats model and return it
        var data=jsonDecode(response.body.toString());
        return WorldStatsModel.fromJson(data);
      }
    else
      {
        Get.snackbar('Error','server responded:${response.statusCode}');
        throw Exception('Error');
      }
  }

  Future<List<dynamic>> getCountriesList() async
  {
    var data;
    http.Response response = await http.get(Uri.parse(AppUrl.countriesList));
    //var data=jsonDecode(response.body.toString());

    if(response.statusCode == 200)
    {
      //if statuscode is 200 then we have to store the data in the worldstats model and return it
      data=jsonDecode(response.body.toString());
      return data;
    }
    else
    {
      throw Exception('Error');
    }
  }



}
