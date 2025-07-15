import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../model/drop_down_model.dart';

class DropDownApi extends StatefulWidget {
  const DropDownApi({Key? key}) : super(key: key);

  @override
  State<DropDownApi> createState() => _DropDownApiState();
}

class _DropDownApiState extends State<DropDownApi> {

  Future<List<DropDownModel>> getpost() async{
    try {
      final response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      var data = jsonDecode(response.body)as List;
      //var dropdownlist = [];

      if (response.statusCode == 200) {

        // for (Map i in data) {
        //   final model = DropDownModel.fromJson(i);
        //   dropdownlist.add(model);
        // }

        return data.map((e){
          final map = e as Map<String,dynamic>;//recording each data
        return DropDownModel(
             userId:map['userId'],
             id:map['id'],
             title:map['title'],
             body:map['body']
        );
        }).toList();//why because the body is list so we will retuen a list
      }
      // else {
      //   return dropdownlist;
      // }
      throw Exception('Error fetching data ');
    }
    on SocketException{
      throw Exception('no internet');
    }
    //throw Exception('Error fetching data');

}



var selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dropdown Api'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              //note ek dropdown mein list ati hai jiske upar click karke uss item ko select kar lete hai
          FutureBuilder(
              future: getpost(),
              builder: (context,snapshot){
            if(!snapshot.hasData)
              {
                return Text('loading');
              }
            else
              {
                return DropdownButton(
                  icon: Icon(Icons.add),
                  value:selectedValue ,
                  isExpanded: true,
                  hint: Text('Select value '),
                    items:snapshot.data!.map((e) =>DropdownMenuItem(value: e.title.toString(),child: Text(e.title.toString()),) ).toList() ,//we have to call the func and that func is in futurebuilder so to access it we use snaopshot .data
                    onChanged:(value){
                     selectedValue=value;
                     setState(() {

                     });
                    },
                );
              }
          })

          ],
        ),
      ),
    );
  }
}
