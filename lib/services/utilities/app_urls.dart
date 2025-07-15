//all the apis used in the app will be defined here

class AppUrl
{
   //this is our base url
   static const String baseUrl ='https://disease.sh/v3/covid-19/';
   //end points of the api
   //fetch world covid stats
   static const String worldStatsApi= baseUrl + 'all';
   static const String countriesList= baseUrl + 'countries';
}