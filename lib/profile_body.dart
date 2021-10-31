import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_try/profile_tabs.dart';


class ProfileBody extends StatefulWidget{

  _ProfileBodyState createState() => _ProfileBodyState();

}

class _ProfileBodyState extends State<ProfileBody>{

  bool _visible = true;

  final ButtonStyle style= ElevatedButton.styleFrom(
    primary: Colors.blue,
    elevation: 5.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );



  final thirdcontainer = Expanded(
    child: new Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => new Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            new Container(
              width:60.0,
              height:60.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(
                        "https://pbs.twimg.com/profile_images/916384996092448768/PF1TSFOE_400x400.jpg")
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
            ),

            index == 0
                ?Positioned(
              //left: 30.0,
              //top: 30.0,
              right: 10.0 ,
              child: new CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 10.0,
              child: new Icon(
                Icons.add,
                size: 14.0,
                color: Colors.black,
              ),
               )
            )
                : new Container()

          ],
        ),
      ),
    ),
  );



  @override
  Widget build(BuildContext context) {
    var devicesize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildpaddedFirstSection(),
          _buildSecondContainer(),
          SizedBox(
            height: devicesize.height * 0.1,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                thirdcontainer,
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 20,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),

          Flexible(
            fit: FlexFit.loose,
            child: _buildFourthContainer(),
          )
        ],
      ) ,
    );
  }



  Container _buildSecondContainer(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_drop_down),
                onPressed: (){
                  setState(() {
                    _visible = !_visible;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
              ),
              Text('Alin Xess',
              style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ]
          ),
          new Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                  ),
                  Icon(Icons.link),
                  new RichText(
                      text:new TextSpan(
                          text: 'www.travel.com',
                          style: TextStyle(color: Colors.blueAccent),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = (){launch('https://pub.dev/');}

                      ) ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                  ),
                  Icon(Icons.add_location),
                  new RichText(
                      text:new TextSpan(
                        text: 'hyderabad',
                        style: TextStyle(color: Colors.blueAccent),
                      ) ),
                ],
              ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 0.0, 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 100),
                    child: Container(
                      width: _visible ? 50.0 : 0.0,
                      height: _visible ? 50.0 : 0.0,
                      color: Colors.green,
                    ),
                  ),
                ),

                Padding(
                  padding: _visible ? const EdgeInsets.only(bottom: 10.0) : const EdgeInsets.only(bottom: 6.0),
                ),

                Text('Followed by asheet.tirkey, shobhit.ekka.')
              ],
            ),
          ),
        ],
      ),
    );


  }



  Container _buildFourthContainer(){
    return Container(
      child: Profiletabs(),
    );
  }

  Padding _buildpaddedFirstSection(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                width:80.0,
                height:80.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(
                          "https://pbs.twimg.com/profile_images/916384996092448768/PF1TSFOE_400x400.jpg")
                  ),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text('21'),
                              Padding(padding: const EdgeInsets.only(bottom: 10.0)),
                              Text('Posts')
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                          ),
                          Column(
                            children: <Widget>[
                              Text('112'),
                              Padding(padding: const EdgeInsets.only(bottom: 10.0)),
                              Text('Followers')
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                          ),
                          Column(
                            children: <Widget>[
                              Text('150'),
                              Padding(padding: const EdgeInsets.only(bottom: 10.0)),
                              Text('Following')
                            ],
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                    ),

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ElevatedButton(
                            style:style,
                            onPressed: () {},
                            child: Text(
                              "Follow",
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.5,
                              ),
                            ),


                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                          ),

                          ElevatedButton(
                            style:style,
                            onPressed: (){},

                            child: Text(
                              "Message",
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),


        ],

      ),
    );
  }
}