import 'package:flutter/material.dart';

class MsgVideo extends StatelessWidget {
  var msg;
  MsgVideo(this.msg);

  @override
  Widget build(BuildContext context) {
    return Image.network("https://bing.nanxiongnandi.com/202204/NorwayBoulder_1920x1080.jpg");
  }
}
