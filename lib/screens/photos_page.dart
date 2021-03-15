import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:camera/camera.dart';
import 'package:provider/provider.dart';

import 'sources.dart';
import 'camera_screen.dart';

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
];

class PhotosPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  PhotosPage({this.cameras});

  @override
  _PhotosPageState createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Select a Photo to Edit'),
      ),
      body: new StaggeredGridView.count(
        primary: false,
        crossAxisCount: 4,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        children: <Widget>[
          new _Tile(
              'assets/images/Photos/Dog1.jpg',
              1,
              'Dog 1',),
          new _Tile(
              'assets/images/Photos/Dog2.jpg',
              2,
              'Dog 2',),
          new _Tile(
              'assets/images/Photos/Eye1.jpg',
              3,
              'Eye 1',),
          new _Tile(
              'assets/images/Photos/Eye2.jpg',
              4,
              'Eye 2',),
          new _Tile(
              'assets/images/Photos/GlassBuilding.jpg',
              5,
              'Glass Building',),
          new _Tile(
              'assets/images/Photos/Jasper.jpg',
              6,
              'Jasper',),
          new _Tile(
              'assets/images/Photos/ManBack.jpg',
              7,
              'Man Back',),
          new _Tile(
              'assets/images/Photos/Pavement.jpg',
              8,
              'Pavement',),
          new _Tile(
              'assets/images/Photos/Street.jpg',
              9,
              'Street',),
          new _Tile(
              'assets/images/Photos/Teasdale.jpg',
              10,
              'Teasdale',),
        ],
        staggeredTiles: const <StaggeredTile>[
          const StaggeredTile.fit(2),
          const StaggeredTile.fit(2),
          const StaggeredTile.fit(2),
          const StaggeredTile.fit(2),
          const StaggeredTile.fit(2),
          const StaggeredTile.fit(2),
          const StaggeredTile.fit(2),
          const StaggeredTile.fit(2),
          const StaggeredTile.fit(2),
          const StaggeredTile.fit(2),
        ],

      ),
      floatingActionButton: new FloatingActionButton(
        heroTag: "cameraBtn",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CameraScreen()),
          );
          },
        child: Icon(Icons.camera_alt),
        backgroundColor: Colors.indigo.shade200,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile(this.source, this.index, this.name);

  final String name;
  final String source;
  final int index;

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new InkWell(
        onTap: () {
          debugPrint('$source');
          Provider.of<Sources>(context, listen: false).changePhoto(source);
          Navigator.pop(
            context,
            source,
          );
        },
        child: new Column(
          children: <Widget>[
            new Image(image: AssetImage(source)),
            new Padding(
              padding: const EdgeInsets.all(4.0),
              child: new Column(
                children: <Widget>[
                  new Text(
                    'Image: $name',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}