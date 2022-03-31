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
  String img = "bulb off";
  String txt = "Off";
  Color th=Colors.black;
  // ThemeData th=ThemeData.dark();
  bool c=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: c?ThemeMode.light:ThemeMode.dark,
      home: Scaffold(
        body: Container(
          color: th,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => c?Colors.black:Colors.white)),
                  onPressed: () {
                    setState(() {
                      if (img == "bulb on") {
                        th=Colors.black;
                        img = "bulb off";
                        txt = "Off";
                        c=false;
                        TorchLight.disableTorch();
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
// ),
// ),
