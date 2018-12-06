import 'package:flutter/material.dart';

class TypableText extends AnimatedWidget {
  final String text;
  final TextStyle style;

  TypableText({Key key,Animation<double> animation,this.text, this.style})
    :super(key:key,listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation  = listenable;
    int totalLettersCount  = text.length;
    int currentLettersCount  = (totalLettersCount * animation.value).round();
    return Text(
      text.substring(0,currentLettersCount,),
      style: style,
    );
  }

}

class TypeableTextFormField extends StatefulWidget{
  final String finalText;
  final InputDecoration decoration;
  final Animation<double> animation;

  const TypeableTextFormField({Key key, this.finalText, this.decoration, this.animation}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new TypeableTextFormFieldState();
      }
    }
    
    class TypeableTextFormFieldState extends State<TypeableTextFormField>{
      final TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: widget.decoration,
      controller: controller,
    );
  }
  @override
  void initState() {
      super.initState();
      widget.animation.addListener((){
        int totalLetterCount = widget.finalText.length;
        int currentLettersCount = (totalLetterCount * widget.animation.value).round();
        setState(() {
                  controller.text = widget.finalText.substring(0,currentLettersCount);
                });
      });
    }
}