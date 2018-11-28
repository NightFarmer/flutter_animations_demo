import 'package:flutter/material.dart';
class Button1 extends StatelessWidget{
  final Color backgroundColor;
  final Text butonText;
  final Color textColor;
  final Function onPressed;

  const Button1({Key key, this.backgroundColor, this.butonText, this.textColor, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(left: 20.0,right: 20.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new FlatButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              splashColor: this.backgroundColor,
              color: this.backgroundColor,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 20.0,bottom: 20.0),
                    child: butonText,
                  ),
                ],
              ),
              onPressed: ()=> onPressed,
            ),
          )
        ],
      ),
    );
  }

}