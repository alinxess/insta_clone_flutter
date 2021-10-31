import'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_try/card_data.dart';


class SearchPageBody extends StatefulWidget{
  _SearchPageBodyState createState() => _SearchPageBodyState();
}

class _SearchPageBodyState extends State<SearchPageBody>{



  @override
  Widget build(BuildContext context) {
      return new StaggeredGridView.countBuilder(
        crossAxisCount: 3,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        itemCount: cardImages.length,
        itemBuilder: (BuildContext context, int index) =>
        new Container(
            child: new Image.network(
              cardImages[index],
              fit: BoxFit.cover,
            ),

        ),
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(((index == 1) || (index == 9)) ? 2 : 1,
            ((index == 1) || (index == 9)) ? 2 : 1),
      );

  }

}