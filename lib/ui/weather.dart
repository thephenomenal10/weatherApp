import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../util/utils.dart';

class Klimatic extends StatefulWidget {
  @override
  _KlimaticState createState() => _KlimaticState();
}

class _KlimaticState extends State<Klimatic> {

  void showStuff() async{
    Map data = getWeather(appId, defaultCity) as Map;
    print(data.toString());
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Klimatic",
          style: new TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.menu), onPressed: showStuff),
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset('images/mainphoto.jpg',
              width: 480.0,
              height: 1200.0,
              fit: BoxFit.fill,
            ),
          ),

          new Container(
              child: new Text(" Dhampur ",
                style: TextStyle(color: Colors.white,
                  fontSize: 35.0,
                  fontStyle: FontStyle.italic,
                  backgroundColor: Colors.black,

                ),
                textDirection: TextDirection.ltr,
              ),
              margin: const EdgeInsets.fromLTRB(255.0, 2.0, 4.0, 0.0)
          ),
          new Container(
            alignment: Alignment.center,
            child: new Image.asset('images/lightrain.png',
              width: 120.0,
              height: 120.0,

            ),
          ),
          new Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.fromLTRB(100.0, 200.0, 0.0, 0.0),
            child: new Text("47.0C", style: new TextStyle(color: Colors.white,fontSize: 50.0),),
          )
        ],
      ),
    );
  }


  Future<Map> getWeather(String appId, String city) async {
    String apiUrl = "http://api.openweathermap.org/data/2.5/weather?q=$city&$appId&units=metric";
    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);

  }
}


