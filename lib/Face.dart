import 'package:flutter/material.dart';
import 'package:flutter_otp/flutter_otp.dart';
import 'package:iot_app/Panel.dart';
import 'dart:math';
import 'package:iot_app/local_auth_api.dart';

class Face extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterOtp otp = FlutterOtp();
    return Scaffold(
      appBar: AppBar(
        title: Text("Unlock Page")
      ),
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child:Row(
                children: [
                  Icon(Icons.fingerprint),
                  SizedBox(width: 10,),
                  Text("Biometrics"),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.blueAccent),
              ),
              onPressed:() async{
                final isAuthenticated = await LocalAuthApi.authenticate();
                if(isAuthenticated){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Panel()),);

                }
              },
            ),

            SizedBox(width: 25,),

            RaisedButton(
                child: Row(
                  children: [
                    Icon(Icons.message),
                    SizedBox(width: 10,),
                    Text("OTP Authentication"),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blueAccent),
                ),
                onPressed:(){
                  var rand = new Random();
                  int _a = 100000 + rand.nextInt(899999);
                  otp.sendOtp('9789696889', 'OTP is : ' + _a.toString(),10000,99999,'+91');
                  var route =  new MaterialPageRoute(
                      builder: (BuildContext context)  => new NextPage(value: _a.toString()),
                  );
                  Navigator.of(context).push(route);
                }
            ),
          ],
        )
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  final String value;

  NextPage({Key key, this.value}) : super(key: key);

  @override
  _NextPageState createState() => new _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Next Page"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (val) {
                int ot = int.parse(val);
                if(ot.bitLength > 17) {
                  if (ot.toString() == "${widget.value}")
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Panel()),);
                  else
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => n()),);
                }
              },

            ),

          ],
        ),
      ),
    );
  }
}

class y extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password Correct"),
      ),
    );
  }
}

class n extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password IN Correct"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("   Invalid Authentication..!",
        style: TextStyle(
          fontSize: 30,
          ),
          )
        ],
        
      ),

    );
  }
}

