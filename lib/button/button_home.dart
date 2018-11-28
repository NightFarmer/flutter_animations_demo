import 'package:flutter/material.dart';
import 'package:flutter_demo/button/button1.dart';
import 'package:flutter_demo/button/button2.dart';
import 'package:flutter_demo/button/button3.dart';

class ButtonHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button'),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
        padding: EdgeInsets.only(top: 30.0),
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: new Column(
          children: <Widget>[
            new Button1(
              backgroundColor: Colors.redAccent,
              butonText: Text(
                "LOGIN",
                style: TextStyle(color: Colors.white),
              ),
              textColor: Colors.white,
            ),
            new Button2(
              backgroundColor: Colors.orangeAccent,
              butonText: Text(
                "SEND EMAIL",
                style: TextStyle(color: Colors.white),
              ),
              textColor: Colors.white,
              icon: Icon(Icons.email),
              iconColor: Colors.black45,
              iconAlignment: Alignment.centerRight,
            ),
            new Button3(
                backgroundColor: Colors.deepOrangeAccent,
                icon: Icon(Icons.share),
                iconAlignment: Alignment.centerRight),
            new Button2(
              backgroundColor: Colors.orangeAccent,
              butonText: Text(
                "SEND EMAIL",
                style: TextStyle(color: Colors.white),
              ),
              textColor: Colors.white,
              icon: Icon(Icons.email),
            ),
            new Row(
              children: <Widget>[
                new Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Button3(
                    backgroundColor: Colors.blueAccent,
                    icon: Icon(Icons.phone),
                    iconAlignment: Alignment.center,
                  ),
                ),
                new Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Button3(
                    backgroundColor: Colors.redAccent,
                    icon: Icon(Icons.message),
                    iconAlignment: Alignment.center,
                  ),
                ),
              ],
            ),
            Button3(
              backgroundColor: Colors.green,
              icon: Icon(Icons.message),
              iconColor: Colors.redAccent,
              iconAlignment: Alignment.centerRight,
            ),
            Button3(
              backgroundColor: Colors.redAccent,
              icon: Icon(Icons.details),
              iconColor: Colors.redAccent,
              iconAlignment: Alignment.centerLeft,
            ),
            new Row(
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width * 0.66,
                child: Button2(
                  backgroundColor: Colors.deepOrangeAccent,
                  butonText: Text("PLAY", style: TextStyle(
                      color: Colors.white
                  ),),
                  textColor: Colors.white,
                  icon: Icon(Icons.play_arrow),
                  iconAlignment: Alignment.centerLeft,
                ),
              ),

              new Container(
                width: MediaQuery.of(context).size.width * 0.33,
                child: Button1(
                  backgroundColor: Colors.greenAccent,
                  butonText: Text("OK", style: TextStyle(
                      color: Colors.green
                  ),),
                  textColor: Colors.white,
                ),
              ),
            ],
          ),

          ],
        ),
      ),
        ],
      )
    );
  }
}
