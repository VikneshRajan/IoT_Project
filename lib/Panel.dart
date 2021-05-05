import 'package:flutter/material.dart';
import 'package:iot_app/Light.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:iot_app/Fan.dart';
import 'package:iot_app/Light.dart';
class Panel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control Panel'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left:0),
              child: GestureDetector(
                onTap: (){
                  String url = "https://api.thingspeak.com/update?api_key=A3L7BJE4MM8DX6HM&field1={}xn";
                  launch(url);
              },
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                    height: 386,
                    width: 368,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15,bottom: 5),
                          child: Image.asset("assets/white house.png"),
                        ),
                        Text(
                          "Press Here to Unlock..!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 30),
                  child: GestureDetector(
                    onTap: (){
                      print("Fan");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Fan()),);
                    },
                    child: Container(
                      height: 180,
                      width: 160,
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10),
                            child: Image.asset("assets/FANN.png"),
                          ),
                          Text(
                            "Fan",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 30),
                  child: GestureDetector(
                    onTap: (){
                      print("Light");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Light()),);
                    },
                    child: Container(
                      height: 180,
                      width: 160,
                      decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15,bottom: 4,top: 2),
                            child: Image.asset("assets/Bulb.png"),
                          ),
                          Text(
                            "Light",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15),
                          )

                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      );
  }
}
