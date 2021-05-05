import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class Fan extends StatefulWidget {
  @override
  _FanState createState() => _FanState();
}

class _FanState extends State<Fan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fan Control'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(height: 200),
          Center(
            child: Padding(padding: EdgeInsets.only(top: 10),
        child: GestureDetector(
            onTap: (){
              print("Fan On");
              String url = "https://api.thingspeak.com/update?api_key=A3L7BJE4MM8DX6HM&field1={}xa";
              String url2 = "https://api.thingspeak.com/update?api_key=CNS8WO4I1W1JMLWH&field2=10";
              launch(url2);
              launch(url);
            },
            child: Container(
              height: 75,
              width: 275,
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(25)
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Switch On",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50),
                  )
                ],
              ),
            ),
        ),
      ),
          ),
          SizedBox(height: 20),
          Center(
            child: Padding(padding: EdgeInsets.only(left: 0),
              child: GestureDetector(
                onTap: (){
                  print("Fan Off");
                  String url = "https://api.thingspeak.com/update?api_key=A3L7BJE4MM8DX6HM&field1={}xb";
                  String url2 = "https://api.thingspeak.com/update?api_key=CNS8WO4I1W1JMLWH&field2=0";
                  launch(url2);
                  launch(url);
                },
                child: Container(
                  height: 75,
                  width: 285,
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Switch OFF",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
