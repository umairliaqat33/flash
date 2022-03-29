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
  String img = "bulb on";
  String txt = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white)),
                  onPressed: () {
                    setState(() {
                      if (img == "bulb on") {
                        img = "bulb off";
                        txt = "Off";
                        TorchLight.disableTorch();
                      } else {
                        img = "bulb on";
                        txt = "On";
                        TorchLight.enableTorch();
                      }
                    });
                  },
                  child: Image.asset("images/$img.png")),
              Text(
                "Torch is $txt",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
