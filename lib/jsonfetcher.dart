import 'package:flutter/material.dart';
import 'package:flutter_app/model/votd_story.dart';
import 'network/services.dart';

class JsonDisplayer extends StatefulWidget {
  @override
  JsonDisplayerState createState() => JsonDisplayerState();
}

class JsonDisplayerState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Text(
          'Hello World',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 32,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

class VotdRaw extends StatelessWidget {
  final String url;

  VotdRaw({Key key, @required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Text(
            "Url ${url}",
          ),
          FutureBuilder<VotdStory>(
            future: getVotdStory(url),
            builder: (context, snapshot) {
              return Text("data ${snapshot.data.title}");
            }
          )
        ]),
      ),
    );
  }
}

