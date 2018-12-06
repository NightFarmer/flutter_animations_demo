import 'package:flutter/material.dart';
import 'package:flutter_demo/animation/animatedList.dart';
import 'package:flutter_demo/animation/animationBuilder.dart';
import 'package:flutter_demo/animation/backdrop.dart';
import 'package:flutter_demo/animation/backdrop_demo.dart';
import 'package:flutter_demo/animation/color_loader.dart';
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
import 'package:flutter_demo/button/button_home.dart';
import 'package:flutter_demo/canvas/canvas_1.dart';
import 'package:flutter_demo/canvas/canvas_2.dart';
import 'package:flutter_demo/canvas/canvas_3.dart';
import 'package:flutter_demo/flutter_ui_challenge_flight_search/flight_serch_home.dart';
import 'package:flutter_demo/loader/color_loader_2.dart';
import 'package:flutter_demo/loader/flip_loader.dart';
import 'package:flutter_demo/loader/loader3.dart';
import 'package:flutter_demo/loader/loader4.dart';
import 'package:flutter_demo/login/login_screen_1.dart';
import 'package:flutter_demo/login/login_screen_2.dart';
import 'package:flutter_demo/login/login_screen_3.dart';
import 'package:flutter_demo/map/leaflet.dart';
import 'package:flutter_demo/ui/challenge_filter_menu.dart';

void main() => runApp(MyApp());
List<Color> colors = [
  Colors.green,
  Colors.red,
  Colors.black,
  Colors.blue,
  Colors.orange
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.red,
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
        '/animation_color': (BuildContext context) {
          return ColorLoader(
            colors: colors,
            duration: Duration(seconds: 1),
          );
        },
        '/loader2': (BuildContext context) {
          return ColorLoader2();
        },
        '/loader3': (BuildContext context) {
          return ColorLoader3(
            radius: 20.0,
            dotRadius: 5.0,
          );
        },
        '/loader4': (BuildContext context) {
          return ColorLoader4();
        },
        '/animation_login': (BuildContext context) {
          return Scaffold(
            body: Container(
              child: LoginScreen1(
                  primaryColor: Color(0xFF4aa0d5),
                  backgroundColor: Colors.white,
                  backgroundImage: new AssetImage('images/pic27.jpg')),
            ),
          );
        },
        '/Filploader': (BuildContext context) {
          return FilpLoader();
        },
        '/login3': (BuildContext context) {
          return LoginScreen3();
        },
        '/buitton': (BuildContext context) {
          return ButtonHome();
        },
        '/leaflet': (BuildContext context) {
          return Leaflet();
        },
        '/canvas1': (BuildContext context) {
          return CircularProgress(
            size: 50.0,
            backgroundColor: Colors.black12,
            circleColor: Colors.orange,
          );
        },
        '/login2': (BuildContext context) {
          return LoginScreen2(
            backgroundColor1: Colors.white,
            backgroundColor2: Colors.white,
            highlightColor: Colors.white,
            foregroundColor: Colors.black,
            logo: AssetImage('images/dsnyc.png'),
          );
        },
        '/canvas2': (BuildContext context) {
          return Canvas2();
        },
        '/canvas3': (BuildContext context) {
          return Canvas3();
        },
        '/menu_test_view': (BuildContext context) {
          return MenuTestView();
        },
        '/flight_search_home': (BuildContext context) {
          return FlightSearchHome();
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
          new OutlineButton(
              child: Text('animation_color'),
              onPressed: () {
                Navigator.of(context).pushNamed('/animation_color');
              }),
          new OutlineButton(
              child: Text('animation_login'),
              onPressed: () {
                Navigator.of(context).pushNamed('/animation_login');
              }),
          new OutlineButton(
              child: Text('loader2'),
              onPressed: () {
                Navigator.of(context).pushNamed('/loader2');
              }),
          new OutlineButton(
              child: Text('loader3'),
              onPressed: () {
                Navigator.of(context).pushNamed('/loader3');
              }),
          new OutlineButton(
              child: Text('loader4'),
              onPressed: () {
                Navigator.of(context).pushNamed('/loader4');
              }),
          new OutlineButton(
              child: Text('Filploader'),
              onPressed: () {
                Navigator.of(context).pushNamed('/Filploader');
              }),
          new OutlineButton(
              child: Text('login2'),
              onPressed: () {
                Navigator.of(context).pushNamed('/login2');
              }),
          new OutlineButton(
              child: Text('login3'),
              onPressed: () {
                Navigator.of(context).pushNamed('/login3');
              }),
          new OutlineButton(
              child: Text('buitton'),
              onPressed: () {
                Navigator.of(context).pushNamed('/buitton');
              }),
          new OutlineButton(
              child: Text('canvas1'),
              onPressed: () {
                Navigator.of(context).pushNamed('/canvas1');
              }),
          new OutlineButton(
              child: Text('canvas2'),
              onPressed: () {
                Navigator.of(context).pushNamed('/canvas2');
              }),
          new OutlineButton(
              child: Text('leaflet'),
              onPressed: () {
                Navigator.of(context).pushNamed('/leaflet');
              }),
          new OutlineButton(
              child: Text('canvas3'),
              onPressed: () {
                Navigator.of(context).pushNamed('/canvas3');
              }),
          new OutlineButton(
              child: Text('MenuTestView'),
              onPressed: () {
                Navigator.of(context).pushNamed('/menu_test_view');
              }),
          new OutlineButton(
              child: Text('flight_search_home'),
              onPressed: () {
                Navigator.of(context).pushNamed('/flight_search_home');
              }),
        ],
      ),
    );
  }
}
