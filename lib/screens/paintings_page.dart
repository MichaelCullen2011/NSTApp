import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:provider/provider.dart';

import 'sources.dart';


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
  const StaggeredTile.count(2, 2),
];

class PaintingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Select a Painting to Style From'),
      ),
      body: new StaggeredGridView.count(
        primary: false,
        crossAxisCount: 4,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        children: <Widget>[
          new _Tile(
            'assets/images/Styles/Impression, Sunrise.jpg',
            1,
            'Impression, Sunrise',
            'Claude Monet',),
          new _Tile(
            'assets/images/Styles/MonaLisa.jpg',
            2,
            'Mona Lisa',
            'Leonardo Da Vinci',),
          new _Tile(
            'assets/images/Styles/Kandinsky.jpg',
            3,
            'Composition VII (1913)',
            'Wassily Kandinsky',),
          new _Tile(
            'assets/images/Styles/Irises.jpg',
            4,
            'Irises',
            'Vincent Van Gogh',),
          new _Tile(
            'assets/images/Styles/TheGreatWave.jpg',
            5,
            'The Great Wave off Kanagawa',
            'Hokusai',),
          new _Tile(
            'assets/images/Styles/Picasso.jpg',
            6,
            'femme au béret et à la robe quadrillée',
            'Pablo Picasso',),
          new _Tile(
            'assets/images/Styles/TheScream.jpg',
            7,
            'The Scream',
            'Edvard Munch',),
          new _Tile(
            'assets/images/Styles/Portrait.jpg',
            8,
            'Self Portrait',
            'Vincent Van Gogh',),
          new _Tile(
            'assets/images/Styles/Space.jpg',
            9,
            'Space',
            'Nasa',),
          new _Tile(
            'assets/images/Styles/TheStarryNight.jpg',
            10,
            'The Starry Night',
            'Vincent Van Gogh',),
          new _Tile(
            'assets/images/Styles/Pollock.jpg',
            11,
            'The Moon-Woman Cuts the Circle',
            'Jackson Pollock',),
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
          const StaggeredTile.fit(2),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile(this.source, this.index, this.name, this.artist);

  final String name;
  final String source;
  final String artist;
  final int index;


  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new InkWell(
        onTap: () {
          Provider.of<Sources>(context, listen: false).changeStyle(source);
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
                    '$name',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  new Text(
                    '$artist',
                    style: const TextStyle(color: Colors.grey),
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