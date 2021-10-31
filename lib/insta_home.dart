

import 'package:flutter/material.dart';
import 'package:flutter_try/insta_list.dart';
import 'package:flutter_try/new_post.dart';
import 'package:flutter_try/profile_page.dart';
import 'package:flutter_try/search_page.dart';



class InstaHome extends StatefulWidget{
  _InstaHomeState createState() => _InstaHomeState();
}

class _InstaHomeState extends State<InstaHome>{

  final GlobalKey<NavigatorState> _navigatorKey= GlobalKey<NavigatorState>();
  int _currentTabIndex = 0;

  final homeBar= new AppBar(
    backgroundColor: new Color(0xfff8faf8),
    centerTitle: true,
    elevation: 1.0,
    leading:new Icon(Icons.camera_alt),
    title: SizedBox(
        height: 35.0, child: Image.asset("assets/images/Instagram-Logo.png")),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right:12.0),
        child: Icon(Icons.send),
      )
    ],
  );

  final searchBar= new AppBar(
    backgroundColor: new Color(0xfff8faf8),
    centerTitle: true,
    elevation: 1.0,
    leading:new Icon(Icons.search),
    title: SizedBox(
        height: 35.0, child: Text('')),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right:12.0),
        child: Icon(Icons.more_vert),
      )
    ],
  );

  final profileBar= new AppBar(
    backgroundColor: new Color(0xfff8faf8),
    centerTitle: true,
    elevation: 1.0,
    leading:new Icon(Icons.arrow_back),
    title: SizedBox(
        height: 35.0, child: Text('')),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right:12.0),
        child: Icon(Icons.more_vert),
      )
    ],
  );




  Widget _bottomNavigationBar(){
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.black54 ,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle),
          label: "New Post",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
      onTap: _onTap,
      currentIndex: _currentTabIndex,
      selectedItemColor: Colors.black,
    );
  }

  _onTap(int tabIndex){
    switch(tabIndex){
      case 0:
        _navigatorKey.currentState!.pushReplacementNamed("Home");
        break;
      case 1:
        _navigatorKey.currentState!.pushReplacementNamed("Search");
        break;
      case 2:
        _navigatorKey.currentState!.pushReplacementNamed("New Post");
        break;
      case 3:
        _navigatorKey.currentState!.pushReplacementNamed("Profile");
        break;
    }

    setState(() {
      _currentTabIndex=tabIndex;
    });
  }

  Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case "Search":
        return MaterialPageRoute(builder: (context) => SearchPage());
      case "New Post":
        return MaterialPageRoute(builder: (context) => NewPost());
      case "Profile":
        return MaterialPageRoute(builder: (context) => Profile());
      default:
        return MaterialPageRoute(builder: (context) => InstaList());
    }
  }



  @override
  Widget build(BuildContext context) {
    AppBar? topBar;
    switch(_currentTabIndex){
      case 0:
        topBar= homeBar;
        break;
      case 1:
        topBar= searchBar;
        break;
      case 2:
        topBar= homeBar;
        break;
      case 3:
        topBar= homeBar;
        break;
      case 4:
        topBar= profileBar;
        break;
    }

    return new Scaffold(
      appBar: topBar,
      body: Navigator(key: _navigatorKey,onGenerateRoute: generateRoute),
      bottomNavigationBar:_bottomNavigationBar(),
    );
  }
}