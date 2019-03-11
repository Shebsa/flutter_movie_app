import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var content = Scaffold(
      appBar: _buildCupertinoNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 32.0),
            _buildTabBar(),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                    child: Image.asset(
                      "assets/annihilation.jpg",
                      width: 32.0,
                      height: 370.0,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 10.0,
                        offset: Offset(0.0, 5),
                        color: Colors.black54)
                  ]),
                ),
                _buildCoverImage(),
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                    child: Image.asset(
                      "assets/annihilation.jpg",
                      width: 32.0,
                      height: 370.0,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 10.0,
                        offset: Offset(0.0, 5),
                        color: Colors.black54)
                  ]),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            _buildDescription(),
            SizedBox(height: 20.0),
            _buildRatingsRow(),
            SizedBox(height: 16.0),
            _buildBuyTicketsButton(),
            SizedBox(height: 8.0),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white30,
              size: 36.0,
            )
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
    );

    return Stack(
      children: <Widget>[_buildBackground(), content],
    );
  }

  RaisedButton _buildBuyTicketsButton() {
    return RaisedButton(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 8.0),
        child: Text(
          "Buy Tickets",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      onPressed: () {},
      elevation: 0.0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
            color: Colors.white,
            width: 2.0,
          )),
    );
  }

  Column _buildDescription() {
    return Column(
      children: <Widget>[
        Text(
          "Annihilation",
          style: TextStyle(
            fontSize: 34.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.6,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          "Fantasy / Mystery  •  2 hours",
          style: TextStyle(
            color: Colors.white30,
            fontSize: 15.0,
          ),
        ),
      ],
    );
  }

  Row _buildRatingsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildRatingItem("7.0", "IMDB"),
        SizedBox(width: 32.0),
        _buildRatingItem("87%", "Rotten Tomato"),
        SizedBox(width: 32.0),
        _buildRatingItem("79%", "Metacritic"),
      ],
    );
  }

  Column _buildRatingItem(String rating, String source) {
    return Column(
      children: <Widget>[
        Text(
          rating,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
        Text(
          source,
          style: TextStyle(
            color: Colors.white30,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }

  Widget _buildCoverImage() {
    return Container(
      alignment: Alignment.center,
      width: 280.0,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              "assets/annihilation.jpg",
              width: 270.0,
              height: 408.0,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Icon(
              Icons.play_circle_filled,
              color: Colors.white54,
              size: 60.0,
            ),
          )
        ],
        alignment: Alignment.center,
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: Offset(0.0, 40.0),
          color: Colors.black54,
          blurRadius: 45.0,
          spreadRadius: 0.0,
        ),
      ]),
    );
  }

  Container _buildTabBar() {
    return Container(
      height: 36.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(width: 32.0),
          _buildTabItem("Now Showing", selected: true),
          SizedBox(width: 32.0),
          _buildTabItem("Cinema"),
          SizedBox(width: 32.0),
          _buildTabItem("Coming Soon"),
          SizedBox(width: 32.0),
        ],
      ),
    );
  }

  Widget _buildTabItem(String text, {bool selected = false}) {
    BoxDecoration decoration;

    if (selected) {
      decoration = BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white30,
            width: 2.0,
          ),
        ),
      );
    }

    return Container(
      child: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.white : Colors.white30,
          fontSize: 20.0,
        ),
      ),
      decoration: decoration,
    );
  }

  CupertinoNavigationBar _buildCupertinoNavigationBar() {
    return CupertinoNavigationBar(
      actionsForegroundColor: Colors.white,
      backgroundColor: Colors.transparent,
      border: Border(),
      middle: Text(
        "Movies",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
      leading: CupertinoButton(
        onPressed: () {},
        child: Icon(
          Icons.sort,
        ),
      ),
      trailing: CupertinoButton(
        onPressed: () {},
        child: Icon(
          Icons.search,
        ),
      ),
    );
  }

  Widget _buildBackground() => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 113, 151, 204),
              Color.fromARGB(255, 64, 83, 154),
            ],
          ),
        ),
      );
}
