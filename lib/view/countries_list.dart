import 'package:covid19_tracker_app/view/country_detail_screen.dart';
import 'package:covid19_tracker_app/widget/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../services/stats_services.dart';
import '../services/utilities/controller.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  // TextEditingController searchController=TextEditingController();

  //Controller controller = Get.put(Controller());
  Controller controller =Get.find<Controller>();
  //StatsServices statsServices = StatsServices();


  @override
  void initState() {
    controller.countriesApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final size=MediaQuery.of(context).size;
    // final height=size.height * 1 ;
    // final width =size.width * 1;

    final height = Get.height * 1;
    final width = Get.width * 1;

    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black12,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: 'Countries',
        ),
        //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Obx(() => TextField(
                controller: controller.searchController.value,
                style: TextStyle(color: Colors.white),
                 onChanged:(value) {
                   // setState(() {});
                   //controller.UpdateTextEditingController(value);
                 
                 controller.filterCountries(value);
                 },
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: width * 0.1),
                    hintText: 'Search with country name',
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width * 0.5),
                    )),
              ),
              ),

              //using set state
              //using expanded as we are building a list
              // Expanded(
              //   child: FutureBuilder(
              //     future: statsServices.getCountriesList(),
              //     builder: (context, snapshot) {
              //       //now till the time data is loading we want shimmer effects
              //       if (!snapshot.hasData) {
              //         return ListView.builder(
              //             itemCount: 10, //length of list of countries
              //             itemBuilder: (context, index) {
              //               return Shimmer.fromColors(
              //                 baseColor: Colors.grey.shade700,
              //                 highlightColor: Colors.grey.shade100,
              //                 child: Column(
              //                   children: [
              //                     SizedBox(
              //                       height: height * 0.02,
              //                     ),
              //                     ListTile(
              //                       title: Container(
              //                         height: 10,
              //                         width: 89,
              //                         color: Colors.white,
              //                       ),
              //                       subtitle: Container(
              //                         height: 10,
              //                         width: 89,
              //                         color: Colors.white,
              //                       ),
              //                       leading: Container(
              //                         height: 50,
              //                         width: 50,
              //                         color: Colors.white,
              //                       ),
              //                       //trailing: ,
              //                     ),
              //                     SizedBox(
              //                       height: height * 0.01,
              //                     )
              //                   ],
              //                 ),
              //               );
              //             });
              //       } else {
              //         return ListView.builder(
              //             itemCount: snapshot.data!.length,
              //             //length of list of countries
              //             itemBuilder: (context, index) {
              //               //to filter list from search bar
              //               String name = snapshot.data![index]['country'];
              //               //if(searchController.text.isEmpty)//note if search bar is empty all the data should be displayed
              //               if (controller.searchController.value.text.isEmpty) {
              //                 return Column(
              //                   children: [
              //                     SizedBox(
              //                       height: height * 0.02,
              //                     ),
              //                     InkWell(
              //                       onTap: () {
              //                         Navigator.push(
              //                           context,
              //                           MaterialPageRoute(
              //                             builder: (context) => DetailScreen(
              //                               name: snapshot.data![index]
              //                                   ['country'],
              //                               image: snapshot.data![index]
              //                                   ['countryInfo']['flag'],
              //                               totalCases: snapshot.data![index]
              //                                   ['cases'],
              //                               totalRecovered: snapshot
              //                                   .data![index]['recovered'],
              //                               todayRecovered: snapshot
              //                                   .data![index]['todayRecovered'],
              //                               totalDeaths: snapshot.data![index]
              //                                   ['deaths'],
              //                               active: snapshot.data![index]
              //                                   ['active'],
              //                               test: snapshot.data![index]
              //                                   ['tests'],
              //                               critical: snapshot.data![index]
              //                                   ['critical'],
              //                             ),
              //                           ),
              //                         );
              //                       },
              //                       child: ListTile(
              //                         title: CustomText(
              //                             text: snapshot.data![index]
              //                                 ['country'],
              //                             align: TextAlign.left,
              //                             size: 18),
              //                         leading: Image(
              //                           height: height * 0.15,
              //                           width: width * 0.15,
              //                           image: NetworkImage(
              //                               snapshot.data![index]['countryInfo']
              //                                   ['flag']),
              //                         ),
              //                         subtitle: CustomText(
              //                             text: snapshot.data![index]['cases']
              //                                 .toString(),
              //                             align: TextAlign.left,
              //                             size: 15),
              //                         //trailing: ,
              //                       ),
              //                     ),
              //                     SizedBox(
              //                       height: height * 0.01,
              //                     )
              //                   ],
              //                 );
              //               }
              //               //else if (name.toLowerCase().contains(searchController.text.toLowerCase()))//user has written something in the search bar
              //               else if (name.toLowerCase().contains(controller.searchController.value.text.toLowerCase())) {
              //                 return Column(
              //                   children: [
              //                     SizedBox(
              //                       height: height * 0.02,
              //                     ),
              //                     InkWell(
              //                       onTap: () {
              //                         Navigator.push(
              //                           context,
              //                           MaterialPageRoute(
              //                             builder: (context) => DetailScreen(
              //                               name: snapshot.data![index]
              //                                   ['country'],
              //                               image: snapshot.data![index]
              //                                   ['countryInfo']['flag'],
              //                               totalCases: snapshot.data![index]
              //                                   ['cases'],
              //                               totalRecovered: snapshot
              //                                   .data![index]['recovered'],
              //                               todayRecovered: snapshot
              //                                   .data![index]['todayRecovered'],
              //                               totalDeaths: snapshot.data![index]
              //                                   ['deaths'],
              //                               active: snapshot.data![index]
              //                                   ['active'],
              //                               test: snapshot.data![index]
              //                                   ['tests'],
              //                               critical: snapshot.data![index]
              //                                   ['critical'],
              //                             ),
              //                           ),
              //                         );
              //                       },
              //                       child: ListTile(
              //                         title: CustomText(
              //                             text: snapshot.data![index]
              //                                 ['country'],
              //                             align: TextAlign.left,
              //                             size: 18),
              //                         leading: Image(
              //                           height: height * 0.15,
              //                           width: width * 0.15,
              //                           image: NetworkImage(
              //                               snapshot.data![index]['countryInfo']
              //                                   ['flag']),
              //                         ),
              //                         subtitle: CustomText(
              //                             text: snapshot.data![index]['cases']
              //                                 .toString(),
              //                             align: TextAlign.left,
              //                             size: 15),
              //                       ),
              //                     ),
              //                     SizedBox(
              //                       height: height * 0.01,
              //                     )
              //                   ],
              //                 );
              //               } else {
              //                 return Container();
              //               }
              //             });
              //       }
              //     },
              //   ),
              // ),

              //get x controller

              //using getx but not working properly
      // Obx(()=>
      //    Expanded(
      //       child:
      //           //now till the time data is loading we want shimmer effects
      //           (controller.countries_list.isEmpty) ?
      //             ListView.builder(
      //                 itemCount: 10, //length of list of countries
      //                 itemBuilder: (context, index) {
      //                   return Shimmer.fromColors(
      //                     baseColor: Colors.grey.shade700,
      //                     highlightColor: Colors.grey.shade100,
      //                     child: Column(
      //                       children: [
      //                         SizedBox(
      //                           height: height * 0.02,
      //                         ),
      //                         ListTile(
      //                           title: Container(
      //                             height: 10,
      //                             width: 89,
      //                             color: Colors.white,
      //                           ),
      //                           subtitle: Container(
      //                             height: 10,
      //                             width: 89,
      //                             color: Colors.white,
      //                           ),
      //                           leading: Container(
      //                             height: 50,
      //                             width: 50,
      //                             color: Colors.white,
      //                           ),
      //                           //trailing: ,
      //                         ),
      //                         SizedBox(
      //                           height: height * 0.01,
      //                         )
      //                       ],
      //                     ),
      //                   );
      //                 }):
      //
      //             ListView.builder(
      //                 itemCount: controller.countries_list.value.length,
      //                 //length of list of countries
      //                 itemBuilder: (context, index) {
      //                   //to filter list from search bar
      //                   String name = controller.countries_list.value[index]['country'];
      //                   //if(searchController.text.isEmpty)//note if search bar is empty all the data should be displayed
      //                   if (controller.searchController.value.text.isEmpty) {
      //                     return Column(
      //                       children: [
      //                         SizedBox(
      //                           height: height * 0.02,
      //                         ),
      //                         InkWell(
      //                           onTap: () {
      //                             Navigator.push(
      //                               context,
      //                               MaterialPageRoute(
      //                                 builder: (context) => DetailScreen(
      //                                   name: controller.countries_list.value[index]
      //                                       ['country'],
      //                                   image:controller.countries_list.value[index]
      //                                       ['countryInfo']['flag'],
      //                                   totalCases: controller.countries_list.value[index]
      //                                       ['cases'],
      //                                   totalRecovered:controller.countries_list.value[index]['recovered'],
      //                                   todayRecovered:controller.countries_list.value[index]['todayRecovered'],
      //                                   totalDeaths:controller.countries_list.value[index]
      //                                       ['deaths'],
      //                                   active: controller.countries_list.value[index]
      //                                       ['active'],
      //                                   test:controller.countries_list.value[index]
      //                                       ['tests'],
      //                                   critical: controller.countries_list.value[index]
      //                                       ['critical'],
      //                                 ),
      //                               ),
      //                             );
      //                           },
      //                           child: ListTile(
      //                             title: CustomText(
      //                                 text: controller.countries_list.value[index]
      //                                     ['country'],
      //                                 align: TextAlign.left,
      //                                 size: 18),
      //                             leading: Image(
      //                               height: height * 0.15,
      //                               width: width * 0.15,
      //                               image: NetworkImage(
      //                                   controller.countries_list.value[index]['countryInfo']
      //                                       ['flag']),
      //                             ),
      //                             subtitle: CustomText(
      //                                 text: controller.countries_list.value[index]['cases']
      //                                     .toString(),
      //                                 align: TextAlign.left,
      //                                 size: 15),
      //                             //trailing: ,
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           height: height * 0.01,
      //                         )
      //                       ],
      //                     );
      //                   }
      //                   //else if (name.toLowerCase().contains(searchController.text.toLowerCase()))//user has written something in the search bar
      //                   else if (name.toLowerCase().contains(controller.searchController.value.text.toLowerCase())) {
      //                     return Column(
      //                       children: [
      //                         SizedBox(
      //                           height: height * 0.02,
      //                         ),
      //                         InkWell(
      //                           onTap: () {
      //                             Navigator.push(
      //                               context,
      //                               MaterialPageRoute(
      //                                 builder: (context) => DetailScreen(
      //                                   name: controller.countries_list.value[index]
      //                                       ['country'],
      //                                   image: controller.countries_list.value[index]
      //                                       ['countryInfo']['flag'],
      //                                   totalCases: controller.countries_list.value[index]
      //                                       ['cases'],
      //                                   totalRecovered: controller.countries_list.value[index]['recovered'],
      //                                   todayRecovered: controller.countries_list.value[index]['todayRecovered'],
      //                                   totalDeaths: controller.countries_list.value[index]
      //                                       ['deaths'],
      //                                   active: controller.countries_list.value[index]
      //                                       ['active'],
      //                                   test: controller.countries_list.value[index]
      //                                       ['tests'],
      //                                   critical: controller.countries_list.value[index]
      //                                       ['critical'],
      //                                 ),
      //                               ),
      //                             );
      //                           },
      //                           child: ListTile(
      //                             title: CustomText(
      //                                 text: controller.countries_list.value[index]['country'],
      //                                 align: TextAlign.left,
      //                                 size: 18),
      //                             leading: Image(
      //                               height: height * 0.15,
      //                               width: width * 0.15,
      //                               image: NetworkImage(
      //                                   controller.countries_list.value[index]['countryInfo']
      //                                       ['flag']),
      //                             ),
      //                             subtitle: CustomText(
      //                                 text: controller.countries_list.value[index]['cases']
      //                                     .toString(),
      //                                 align: TextAlign.left,
      //                                 size: 15),
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           height: height * 0.01,
      //                         )
      //                       ],
      //                     );
      //                   } else {
      //                     return Container();
      //                   }
      //                 })
      //
      //
      //     ),
      // ),




             // filtering using getx working correctly
              Obx(
                    ()=>Expanded(
                      child:
                      //now till the time data is loading we want shimmer effects
                      (controller.countries_list.isEmpty) ?
                         ListView.builder(
                            itemCount: 10, //length of list of countries
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade700,
                                highlightColor: Colors.grey.shade100,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    ListTile(
                                      title: Container(
                                        height: 10,
                                        width: 89,
                                        color: Colors.white,
                                      ),
                                      subtitle: Container(
                                        height: 10,
                                        width: 89,
                                        color: Colors.white,
                                      ),
                                      leading: Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.white,
                                      ),
                                      //trailing: ,
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    )
                                  ],
                                ),
                              );
                            }) :
                          ListView.builder(
                            itemCount: controller.foundCountries.length,
                            //length of list of countries
                            itemBuilder: (context, index) {
                              //to filter list from search bar
                              String name = controller.foundCountries.value[index]['country'];
                              //if(searchController.text.isEmpty)//note if search bar is empty all the data should be displayed
                              //if (controller.searchController.value.text.isEmpty) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                              name: controller.foundCountries.value[index]
                                              ['country'],
                                              image:controller.foundCountries.value[index]
                                              ['countryInfo']['flag'],
                                              totalCases: controller.foundCountries.value[index]
                                              ['cases'],
                                              totalRecovered:controller.foundCountries.value[index]['recovered'],
                                              todayRecovered:controller.foundCountries.value[index]['todayRecovered'],
                                              totalDeaths:controller.foundCountries.value[index]
                                              ['deaths'],
                                              active: controller.foundCountries.value[index]
                                              ['active'],
                                              test:controller.foundCountries.value[index]
                                              ['tests'],
                                              critical: controller.foundCountries.value[index]
                                              ['critical'],
                                            ),
                                          ),
                                        );
                                      },
                                      child: ListTile(
                                        title: CustomText(
                                            text: controller.foundCountries.value[index]
                                            ['country'],
                                            align: TextAlign.left,
                                            size: 18),
                                        leading: Image(
                                          height: height * 0.15,
                                          width: width * 0.15,
                                          image: NetworkImage(
                                              controller.foundCountries.value[index]['countryInfo']
                                              ['flag']),
                                        ),
                                        subtitle: CustomText(
                                            text: controller.foundCountries.value[index]['cases']
                                                .toString(),
                                            align: TextAlign.left,
                                            size: 15),
                                        //trailing: ,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    )
                                  ],
                                );
                                //no need of if elseif and else because now what we are doing is if we do not have any data in the
                              //country list then show shimmery list else show all the countries list coming from api
                              //and here the list of the length is found countries because initially found countries length is
                              //the whole length of list coming from api ,but if anything is written is in the search bar then the list
                              //of the foundcountries changes depending upon the total no of match found of the countries list
                              // corresponding to the text written in the search bar to that of countries present in api
                              //}
                              //else if (name.toLowerCase().contains(searchController.text.toLowerCase()))//user has written something in the search bar
                              // else if (name.toLowerCase().contains(controller.searchController.value.text.toLowerCase())) {
                              //   return Column(
                              //     children: [
                              //       SizedBox(
                              //         height: height * 0.02,
                              //       ),
                              //       InkWell(
                              //         onTap: () {
                              //           Navigator.push(
                              //             context,
                              //             MaterialPageRoute(
                              //               builder: (context) => DetailScreen(
                              //                 name: controller.foundCountries.value[index]
                              //                 ['country'],
                              //                 image: controller.foundCountries.value[index]
                              //                 ['countryInfo']['flag'],
                              //                 totalCases: controller.foundCountries.value[index]
                              //                 ['cases'],
                              //                 totalRecovered: controller.foundCountries.value[index]['recovered'],
                              //                 todayRecovered: controller.foundCountries.value[index]['todayRecovered'],
                              //                 totalDeaths: controller.foundCountries.value[index]
                              //                 ['deaths'],
                              //                 active: controller.foundCountries.value[index]
                              //                 ['active'],
                              //                 test: controller.foundCountries.value[index]
                              //                 ['tests'],
                              //                 critical: controller.foundCountries.value[index]
                              //                 ['critical'],
                              //               ),
                              //             ),
                              //           );
                              //         },
                              //         child: ListTile(
                              //           title: CustomText(
                              //               text: controller.foundCountries.value[index]['country'],
                              //               align: TextAlign.left,
                              //               size: 18),
                              //           leading: Image(
                              //             height: height * 0.15,
                              //             width: width * 0.15,
                              //             image: NetworkImage(
                              //                 controller.foundCountries.value[index]['countryInfo']
                              //                 ['flag']),
                              //           ),
                              //           subtitle: CustomText(
                              //               text: controller.foundCountries.value[index]['cases']
                              //                   .toString(),
                              //               align: TextAlign.left,
                              //               size: 15),
                              //         ),
                              //       ),
                              //       SizedBox(
                              //         height: height * 0.01,
                              //       )
                              //     ],
                              //   );
                              // } else {
                              //   return Container();
                              // }
                            }),
                      ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
