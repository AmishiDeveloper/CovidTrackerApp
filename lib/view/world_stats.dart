import 'package:covid19_tracker_app/view/countries_list.dart';
import 'package:covid19_tracker_app/widget/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import '../services/stats_services.dart';
import '../services/utilities/controller.dart';

class WorldStats extends StatefulWidget {
  const WorldStats({Key? key}) : super(key: key);

  @override
  State<WorldStats> createState() => _WorldStatsState();
}

class _WorldStatsState extends State<WorldStats> with TickerProviderStateMixin{
//Controller controller =Get.find<Controller>();
Controller controller = Get.put(Controller());

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 3),
  )..repeat();

  final colorList =<Color>
  [
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

@override
void initState() {
  controller.worldStatsApi();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    StatsServices statsServices=StatsServices();
    //final size=MediaQuery.of(context).size;
    //final height=size.height * 1 ;
    //final width =size.width * 1;
    final height=Get.height * 1 ;
    final width =Get.width * 1;

    return Scaffold(
     backgroundColor: Colors.white12,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
             SizedBox(height:height * 0.01 ,),

              //USING SET STATE

              //now i want my pie chart to build from the api
              // FutureBuilder(
              //      //future: controller.worldStatsApi(),
              //     future: statsServices.getWorldStatsRec(),
              //     builder: (context,snapshot){
              //   if(!snapshot.hasData)
              //     {
              //       return Expanded(
              //           flex: 1,
              //           child:SpinKitFadingCircle(
              //             color: Colors.white,
              //             size: 50.0,
              //             controller: _controller,
              //           )
              //       );
              //     }
              //   else {
              //     return Column(
              //       children: [
              //         PieChart(
              //           dataMap:{
              //             "Total": double.parse(snapshot.data!.cases!.toString()),
              //             "Recovered": double.parse(snapshot.data!.recovered!.toString()),
              //             "Deaths":double.parse(snapshot.data!.deaths!.toString()),
              //           },
              //           chartValuesOptions: const ChartValuesOptions(
              //             showChartValuesInPercentage: true,
              //           ),
              //           chartRadius: width * 0.5,
              //           legendOptions: const LegendOptions(
              //             legendShape:BoxShape.rectangle,
              //             legendPosition: LegendPosition.left,
              //             legendTextStyle: TextStyle(color: Colors.white),
              //           ),
              //           animationDuration:const  Duration(milliseconds: 1200),
              //           chartType: ChartType.ring,
              //           colorList: colorList,
              //         ),
              //         Padding(
              //           padding: EdgeInsets.symmetric(vertical: height *0.02),
              //           child: Card(
              //             color: Colors.grey[800],
              //             child: SingleChildScrollView(
              //               child: Column(
              //                 children: [
              //                   ReusableRow(title:'Total', value:snapshot.data!.cases.toString()),
              //                   ReusableRow(title:'Deaths', value:snapshot.data!.deaths.toString()),
              //                   ReusableRow(title:'Recovered', value:snapshot.data!.recovered.toString()),
              //                   ReusableRow(title:'Active', value:snapshot.data!.active.toString()),
              //                   ReusableRow(title:'Critical', value:snapshot.data!.critical.toString()),
              //                   ReusableRow(title:'Today Deaths', value:snapshot.data!.todayDeaths.toString()),
              //                   ReusableRow(title:'Today Recovered', value:snapshot.data!.todayRecovered.toString()),
              //
              //
              //
              //
              //
              //
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              //         GestureDetector(
              //           onTap:(){
              //             Navigator.push(context,MaterialPageRoute(builder: (context)=>CountriesListScreen()));
              //           },
              //           child: Container(
              //             height: height * 0.06,
              //             decoration: BoxDecoration(
              //               color: Color(0xff1aa260),
              //               borderRadius:BorderRadius.circular(5),
              //             ),
              //             child: const Center(
              //               child: Text('Track Countries'),
              //             ),
              //           ),
              //         ),
              //       ],
              //     );
              //   }
              // }),
















              //get x controller

              //USING GETX

                  Obx(() {
                    if (controller.isLoading == true) {
                      return Expanded(
                          flex: 1,
                          child: SpinKitFadingCircle(
                            color: Colors.white,
                            size: 50.0,
                            controller: _controller,
                          )
                      );
                    }
                    else {
                      return Column(
                        children: [
                          PieChart(
                            dataMap: {
                              "Total": double.parse(
                                  controller.worldstatslist.value.cases!.toString()),
                              "Recovered": double.parse(
                                  controller.worldstatslist.value.recovered!.toString()),
                              "Deaths": double.parse(
                                  controller.worldstatslist.value.deaths!.toString()),
                            },
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValuesInPercentage: true,
                            ),
                            chartRadius: width * 0.5,
                            legendOptions: const LegendOptions(
                              legendShape: BoxShape.rectangle,
                              legendPosition: LegendPosition.left,
                              legendTextStyle: TextStyle(color: Colors.white),
                            ),
                            animationDuration: const Duration(
                                milliseconds: 1200),
                            chartType: ChartType.ring,
                            colorList: colorList,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: height * 0.02),
                            child: Card(
                              color: Colors.grey[800],
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ReusableRow(title: 'Total',
                                        value: controller.worldstatslist.value.cases.toString()),
                                    ReusableRow(title: 'Deaths',
                                        value: controller.worldstatslist.value.deaths
                                            .toString()),
                                    ReusableRow(title: 'Recovered',
                                        value: controller.worldstatslist.value.recovered
                                            .toString()),
                                    ReusableRow(title: 'Active',
                                        value: controller.worldstatslist.value.active
                                            .toString()),
                                    ReusableRow(title: 'Critical',
                                        value: controller.worldstatslist.value.critical
                                            .toString()),
                                    ReusableRow(title: 'Today Deaths',
                                        value: controller.worldstatslist.value.todayDeaths
                                            .toString()),
                                    ReusableRow(title: 'Today Recovered',
                                        value: controller.worldstatslist.value.todayRecovered
                                            .toString()),


                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (
                                  context) => CountriesListScreen()));
                            },
                            child: Container(
                              height: height * 0.06,
                              decoration: BoxDecoration(
                                color: Color(0xff1aa260),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                child: Text('Track Countries'),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title,value;
  ReusableRow({Key? key,required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StatsServices statsServices =StatsServices();

    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             CustomText(text: title),
              CustomText(text: value),
            ],
          ),
          SizedBox(height:0.01,),
          Divider(color: Colors.grey[700],),
        ],
      ),
    );
  }
}

