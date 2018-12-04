import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

  class Leaflet extends StatefulWidget {
    _LeafletState createState() => _LeafletState();
  }
  
  class _LeafletState extends State<Leaflet> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Map'),
        ),
        body: new FlutterMap(
      options: new MapOptions(
        center: new LatLng(33.5, 107.09),
        zoom: 4.0,
      ),
      layers: [
        new TileLayerOptions(
          urlTemplate: "http://www.google.cn/maps/vt?lyrs=m@189&gl=cn&x={x}&y={y}&z={z}",
        ),
        new MarkerLayerOptions(
          markers: [
            new Marker(
              width: 10.0,
              height: 10.0,
              point: new LatLng(51.5, -0.09),
              builder: (ctx) =>
              new Container(
                child: new FlutterLogo(),
              ),
            ),
          ],
        ),
      ],
    )
      );
    }
  }
