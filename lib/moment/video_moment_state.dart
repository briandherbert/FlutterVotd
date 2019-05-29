import 'package:flutter/material.dart';

import 'moment_widget.dart';
import 'package:flutter_app/ui/video_player.dart';
import 'package:flutter_app/constants.dart';

class VideoMomentState extends MomentState {
  final formController = TextEditingController();

  @override
  String getName() {
    return "Video";
  }

  @override
  Widget getContent() {
    return Center(
        child: VideoPlayerScreen(url: Constants.getImageUrl(widget.moment.content.url))
        //Image.network(Constants.getImageUrl(widget.moment.content.image), fit: BoxFit.fill));
    );
  }
}
