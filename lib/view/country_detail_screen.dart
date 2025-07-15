import 'package:covid19_tracker_app/view/world_stats.dart';
import 'package:covid19_tracker_app/widget/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  String name,image;
  int totalCases,totalDeaths,totalRecovered,active,critical,todayRecovered,test;
  DetailScreen({
    Key? key,
    required this.name,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.image,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    //final size=MediaQuery.of(context).size;
    //final height=size.height * 1 ;
    //final width =Get.width * 1;
    final height=Get.height * 1 ;
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(

        foregroundColor: Colors.white,
        backgroundColor: Colors.black12,
        title: CustomText(text: widget.name,),
        centerTitle: true,
      ),
      body: SafeArea(
        child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Stack(
                //   alignment: Alignment.topCenter,
                //   children: [
                //
                //     Padding(
                //       padding:EdgeInsets.only(top:height * 0.067),
                //       child: Card(
                //         color: Colors.white12,
                //         child: Column(
                //           children: [
                //             SizedBox(height: height * 0.06,),
                //             ReusableRow(title:'Cases',value:widget.totalCases.toString()),
                //             ReusableRow(title:'Recovered',value:widget.totalRecovered.toString()),
                //             ReusableRow(title:'Deaths',value:widget.totalDeaths.toString()),
                //             ReusableRow(title:'Critical',value:widget.critical.toString()),
                //             ReusableRow(title:'Today Recovered',value:widget.todayRecovered.toString()),
                //             ReusableRow(title:'Active',value:widget.active.toString()),
                //           ],
                //         ),
                //       ),
                //     ),
                //     CircleAvatar(
                //       radius: 40,
                //       backgroundImage: NetworkImage(widget.image),
                //     ),
                //   ],
                // )

                  Padding(
                  padding:EdgeInsets.only(top:height * 0.067),
                  child: Card(
                    color: Colors.white12,
                    child: Column(
                      children: [
                        Container(
                          transform:Matrix4.translationValues(0.0, -50.0, 0.0),
                          child: ClipOval(
                            child: Image.network(
                              widget.image,
                              height: 120,
                              width: 120,
                              fit: BoxFit.fill,
                            ),
                          )
                          // CircleAvatar(
                          //         radius: 60,
                          //         backgroundImage: NetworkImage(widget.image),
                          //       ),
                        ),
                        //SizedBox(height: height * 0.001,),
                        ReusableRow(title:'Cases',value:widget.totalCases.toString()),
                        ReusableRow(title:'Recovered',value:widget.totalRecovered.toString()),
                        ReusableRow(title:'Deaths',value:widget.totalDeaths.toString()),
                        ReusableRow(title:'Critical',value:widget.critical.toString()),
                        ReusableRow(title:'Today Recovered',value:widget.todayRecovered.toString()),
                        ReusableRow(title:'Active',value:widget.active.toString()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ),
    );
  }
}
