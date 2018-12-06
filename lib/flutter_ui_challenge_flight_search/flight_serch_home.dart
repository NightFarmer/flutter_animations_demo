import 'package:flutter/material.dart';
import 'package:flutter_demo/flutter_ui_challenge_flight_search/air_asia_bar.dart';
import 'package:flutter_demo/flutter_ui_challenge_flight_search/content_card.dart';
import 'package:flutter_demo/flutter_ui_challenge_flight_search/rounded_button.dart';

class FlightSearchHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      body: new Stack(
        children: <Widget>[
          AirAsiaBar(
            height: 210.0,
          ),
          Positioned.fill(
            child: new Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 40.0,
              ),
              child: new Column(
                children: <Widget>[
                  _buildButtonsRow(),
                  Expanded(child: ContentCard()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtonsRow() {
    return new Padding(
      padding: EdgeInsets.all(8.0),
      child: new Row(
        children: <Widget>[
          new RoundedButton(text: "ONE WAY"),
          new RoundedButton(text: "ROUND"),
          new RoundedButton(text: "MULTICITY",selected: true),
        ],
      ),
    );
  }
}
