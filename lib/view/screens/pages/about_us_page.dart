import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //todo
        body: Center(
          child: AnimatedContainer(
              color: _selected ? Colors.redAccent : null,
              width: _selected ? 300 : 50,
              height: _selected ? 200 : 25,
              alignment: _selected ? Alignment.center : Alignment.topCenter,
              duration: Duration(milliseconds: 1000),
              curve: Curves.fastOutSlowIn,
              child: AutoSizeText(
                "News Feed App",
                style: TextStyle(fontSize: 40.0),
                minFontSize: 6.0,
                maxLines: 1,
                overflow: TextOverflow.visible,
              )
              // child: _selected
              //     ? Text(
              //         "News Feed App",
              //         style: TextStyle(fontSize: 40.0),
              //       )
              //     : Text(
              //         "News Feed App",
              //         style: TextStyle(fontSize: 6.0),
              //       ),
              ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.play_arrow),
            tooltip: "押してみな 飛ぶぞ",
            onPressed: () {
              setState(() {
                _selected = !_selected;
              });
            }),
      ),
    );
  }
}
