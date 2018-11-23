import 'package:flutter/material.dart';
import 'package:flutter_demo/animation/animatedList.dart';
import 'package:flutter_demo/animation/animationBuilder.dart';
import 'package:flutter_demo/animation/backdrop.dart';
import 'package:flutter_demo/animation/backdrop_demo.dart';
import 'package:flutter_demo/animation/curve_animation.dart';
import 'package:flutter_demo/animation/easing.dart';
import 'package:flutter_demo/animation/grid_animation.dart';
import 'package:flutter_demo/animation/maskingganimationwidget.dart';
import 'package:flutter_demo/animation/offsetdelayanimation.dart';
import 'package:flutter_demo/animation/parentinganimation.dart';
import 'package:flutter_demo/animation/radial_hero_rectclip.dart';
import 'package:flutter_demo/animation/springfreefallinganimation.dart';
import 'package:flutter_demo/animation/staggered.dart';
import 'package:flutter_demo/animation/transformationanimationwidget.dart';
import 'package:flutter_demo/animation/using_animation_controller.dart';
import 'package:flutter_demo/animation/valuechangeanimation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/gridAnimation': (BuildContext context) {
          return GridAnimation();
        },
        '/curveAnimation': (BuildContext context) {
          return CurveAnimation();
        },
        '/animationBuilder': (BuildContext context) {
          return AnimationBuilderTest();
        },
        '/animationList': (BuildContext context) {
          return AnimatedListSample();
        },
        '/animation_ease': (BuildContext context) {
          return EasingAnimationWidget();
        },
        '/animation_mask': (BuildContext context) {
          return MaskingAnimationWidget();
        },
        '/animation_offset': (BuildContext context) {
          return OffsetDelayAnimationWidget();
        },
        '/animation_parrent': (BuildContext context) {
          return ParentingAnimationWidget();
        },
        '/animation_spring': (BuildContext context) {
          return SpringFreeFallingAnimation();
        },
        '/animation_tran': (BuildContext context) {
          return TransformationAnimationWidget();
        },
        '/animation_value': (BuildContext context) {
          return ValueChangeAnimationWidget();
        },
        '/animation_use': (BuildContext context) {
          return UsingAnimationControllerPage();
        },
        '/animation_image': (BuildContext context) {
          return ImagesDemo();
        },
        '/animation_expan': (BuildContext context) {
          return RadialExpansionDemo();
        },
        '/animation_back_drop': (BuildContext context) {
          return BackDropPage();
        },
        '/animation_back_drop_demo': (BuildContext context) {
          return BackdropDemo();
        },
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 4.0,
        padding: const EdgeInsets.all(4.0),
        childAspectRatio: 5,
        children: <Widget>[
          new OutlineButton(
            child: Text('gridAnimation'),
            onPressed: () {
              Navigator.of(context).pushNamed('/gridAnimation');
            },
          ),
          new OutlineButton(
            child: Text('curveAnimation'),
            onPressed: () {
              Navigator.of(context).pushNamed('/curveAnimation');
            },
          ),
          new OutlineButton(
            child: Text('animationBuilder'),
            onPressed: () {
              Navigator.of(context).pushNamed('/animationBuilder');
            },
          ),
          new OutlineButton(
            child: Text('animationList'),
            onPressed: () {
              Navigator.of(context).pushNamed('/animationList');
            },
          ),
          new OutlineButton(
              child: Text('animation_ease'),
              onPressed: () {
                Navigator.of(context).pushNamed('/animation_ease');
              }),
          new OutlineButton(
              child: Text('animation_mask'),
              onPressed: () {
                Navigator.of(context).pushNamed('/animation_mask');
              }),
          new OutlineButton(
              child: Text('animation_offset'),
              onPressed: () {
                Navigator.of(context).pushNamed('/animation_offset');
              }),
          new OutlineButton(
              child: Text('animation_parrent'),
              onPressed: () {
                Navigator.of(context).pushNamed('/animation_parrent');
              }),
          new OutlineButton(
              child: Text('animation_spring'),
              onPressed: () {
                Navigator.of(context).pushNamed('/animation_spring');
              }),
          new OutlineButton(
              child: Text('animation_tran'),
              onPressed: () {
                Navigator.of(context).pushNamed('/animation_tran');
              }),
          new OutlineButton(
              child: Text('animation_value'),
              onPressed: () {
                Navigator.of(context).pushNamed('/animation_value');
              }),
          new OutlineButton(
              child: Text('animation_use'),
              onPressed: () {
                Navigator.of(context).pushNamed('/animation_use');
              }),
          new OutlineButton(
              child: Text('animation_image'),
              onPressed: () {
                Navigator.of(context).pushNamed('/animation_image');
              }),
          new OutlineButton(
              child: Text('animation_expan'),
              onPressed: () {
                Navigator.of(context).pushNamed('/animation_expan');
              }),
          new OutlineButton(
              child: Text('animation_back_drop'),
              onPressed: () {
                Navigator.of(context).pushNamed('/animation_back_drop');
              }),
          new OutlineButton(
              child: Text('back_drop_demo'),
              onPressed: () {
                Navigator.of(context).pushNamed('/animation_back_drop_demo');
              }),
        ],
      ),
    );
  }
}
