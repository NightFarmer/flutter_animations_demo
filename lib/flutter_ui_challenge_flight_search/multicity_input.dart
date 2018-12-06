import 'package:flutter/material.dart';
import 'package:flutter_demo/flutter_ui_challenge_flight_search/typable_text.dart';

class MulticityInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MulticityInputState();
  }
}

class MulticityInputState extends State<MulticityInput>
    with SingleTickerProviderStateMixin {
  AnimationController textInputAnimationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textInputAnimationController = new AnimationController(
        vsync: this, duration: Duration(microseconds: 800));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textInputAnimationController.dispose();
  }

  CurvedAnimation _buildInputAnimation({double begin, double end}) {
    return new CurvedAnimation(
        parent: textInputAnimationController,
        curve: Interval(begin, end, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Form(
      child: new Padding(
        padding: EdgeInsets.all(8.0),
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: new TypeableTextFormField(
                finalText: 'Kochfurt',
                animation: _buildInputAnimation(begin: 0.0, end: 0.2),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.flight_takeoff,
                      color: Colors.red,
                    ),
                    labelText: 'Form'),
              ),
            ),
            new Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: new TypeableTextFormField(
                finalText: 'Lake Xanderland',
                animation: _buildInputAnimation(begin: 0.15, end: 0.35),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.flight_land,
                      color: Colors.red,
                    ),
                    labelText: 'To'),
              ),
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: TypeableTextFormField(
                      animation: _buildInputAnimation(begin: 0.3, end: 0.5),
                      finalText: 'South Darian',
                      decoration: InputDecoration(
                        icon: Icon(Icons.flight_land, color: Colors.red),
                        labelText: "To",
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 64.0,
                  alignment: Alignment.center,
                  child: IconButton(
                      onPressed: () => textInputAnimationController.forward(),
                      icon: Icon(Icons.add_circle_outline, color: Colors.grey)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TypeableTextFormField(
                animation: _buildInputAnimation(begin: 0.45, end: 0.65),
                finalText: '4',
                decoration: InputDecoration(
                  icon: Icon(Icons.person, color: Colors.red),
                  labelText: "Passengers",
                ),
              ),
            ),
            new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.date_range, color: Colors.red),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: TypeableTextFormField(
                      animation: _buildInputAnimation(begin: 0.6, end: 0.8),
                      finalText: "29 June 2017",
                      decoration: InputDecoration(labelText: "Departure"),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: TypeableTextFormField(
                      animation: _buildInputAnimation(begin: 0.75, end: 0.95),
                      finalText: "29 June 2017",
                      decoration: InputDecoration(labelText: "Arrival"),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
