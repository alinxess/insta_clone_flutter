
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Profiletabs extends StatefulWidget{
  _ProfiletabsState createState() => _ProfiletabsState();
}

class _ProfiletabsState extends State<Profiletabs> with TickerProviderStateMixin{
TabController? tabController;

  @override
  Widget build(BuildContext context) {
    tabController = new TabController(length: 2, vsync: this);

    var tabBarItem = new TabBar(
      //physics:  new NeverScrollableScrollPhysics(),
      controller: tabController,
      tabs: [
        new Tab(
          text: "For sale",
        ),
        new Tab(
          text: "For auction",
        ),
      ],

      indicatorColor: Colors.black,
    );

    return Column(
       mainAxisAlignment: MainAxisAlignment.start,
       mainAxisSize: MainAxisSize.min,
       children: <Widget>[
         Container(
           child: tabBarItem,
         ),
         Container(
           height: MediaQuery.of(context).size.height,
           child:TabBarView(
             controller: tabController,
             //physics:
             children: [
               Container(
                   child: _buildSaleGrid()
               ),
               Container(
                 child: _buildSaleGrid()
               )
             ],
         )
         )
       ],
    );

  }


  GridView _buildSaleGrid(){
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 21,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            child: new Card(
              elevation: 5.0,
              child: new Container(
                alignment: Alignment.center,
                child: new Text('Item $index'),
              ),
            ),
            onTap: () {
          Navigator.of(context).restorablePush(_dialogBuilder);

            },

          );
        });
  }

static Route<Object?> _dialogBuilder(BuildContext context, Object? arguments) {
  return CupertinoDialogRoute<void>(
    context: context,
    builder: (BuildContext context) {
      return  CupertinoAlertDialog(
        title: Text('GridView'),
        content: Text('Selected Item index'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('OK'),
            onPressed:() {Navigator.of(context).pop();},
          ),
        ],

      );
    },
  );
}

}