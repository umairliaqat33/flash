import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

void main() {

  runApp(TorchApp());
}

class TorchApp extends StatefulWidget {
  @override
  _TorchAppState createState() => _TorchAppState();
}

class _TorchAppState extends State<TorchApp> {
  String img = "bulb off";     //Variable will be used to change images.
  String txt = "Off";           //Variable used to change text of on/off
  Color th=Colors.black;        //Variable to change color of background
  // ThemeData th=ThemeData.dark();
  bool c=false;                 //variable used to control conditional statements in many places.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: c?ThemeMode.light:ThemeMode.dark,          //conditional statement used to change them according to on/off status.
      home: Scaffold(
        body: Container(
          color: th,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,            //will arrange image and text in center vertically.
            mainAxisAlignment: MainAxisAlignment.center,              //will arrange image and text in center horizontally
            children: [
              TextButton(
                  style:ButtonStyle(
                    splashFactory: NoSplash.splashFactory             //removing onclick splash color
                  ),
                  onPressed: () {
                    setState(() {
                      if (img == "bulb on") {
                        th=Colors.black;                              //changing color accordingly to on/off
                        img = "bulb off";
                        txt = "Off";
                        c=false;
                        TorchLight.disableTorch();                    //used torch_Light package to control on or off and it is very simple just used on line to change flash light status but it is not recommended to use this way.
                      } else {
                        img = "bulb on";
                        txt = "On";
                        c=true;
                        th=Colors.white;
                        TorchLight.enableTorch();
                      }
                    });
                  },
                  child: Image.asset("images/$img.png")),
              Text(
                "Torch is $txt",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: c?Colors.black:Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
// SafeArea(
// child: Container(
// color: Colors.white,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// TextButton(
// style: ButtonStyle(
// overlayColor: MaterialStateColor.resolveWith((states) => Colors.white),
// ),
// onPressed: () {
// setState(() {
// if (img == "bulb off") {
// img = "bulb on";
// } else {
// img = "bulb off";
// }
// });
// },
// child: Image.asset("images/$img.png")),
// ],
// ),
// ),(
//                       overlayColor: MaterialStateColor.resolveWith(
//                           (states) => c?Colors.black:Colors.white))
// ),
