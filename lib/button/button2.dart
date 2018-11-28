import 'package:flutter/material.dart';
class Button2 extends StatelessWidget{
  final Color backgroundColor;
  final Text butonText;
  final Color textColor;
  final Function onPressed;
  final Icon icon;
  final Color iconColor;
  final Alignment iconAlignment;

  const Button2({Key key, this.backgroundColor, this.butonText, this.textColor, this.onPressed, this.icon, this.iconColor, this.iconAlignment}) : super(key: key);
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
                  iconAlignment == Alignment.centerLeft ? new Transform.translate(
                    offset: Offset(-10.0, 0.0),
                    child: new Container(
                      padding: EdgeInsets.all(5.0),
                      child: new FlatButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0),
                          
                        ),
                        splashColor: this.backgroundColor,
                        color: this.backgroundColor,
                        child: Icon(icon.icon,color: this.iconColor == null ? this.iconColor: this.backgroundColor,),
                        onPressed: ()=>onPressed,
                      ),
                    ),
                  ):Container(),
                  iconAlignment == Alignment.centerLeft ? new Expanded(
                    child: Container(),
                  ): Container(),
                  new Padding(
                    padding: EdgeInsets.only(top: 20.0,bottom: 20.0),
                    child: butonText,
                  ),
                  iconAlignment == Alignment.centerRight ? new Expanded(
                    child: Container(),
                  ): Container(),
                  iconAlignment == Alignment.centerRight ? new Transform.translate(
                    offset: Offset(10.0, 0.0),
                    child: new Container(
                      padding: const EdgeInsets.all(5.0),
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius:
                            new BorderRadius.circular(28.0)),
                        splashColor: Colors.white,
                        color: Colors.white,
                        child: Icon(
                          icon.icon,
                          color: iconColor == null ? backgroundColor : iconColor,
                        ),
                        onPressed: () => {},
                      ),
                    ),
                  ) : Container()

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