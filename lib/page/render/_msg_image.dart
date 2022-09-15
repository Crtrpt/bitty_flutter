import 'package:flutter/material.dart';

class MsgImage extends StatelessWidget {
  var msg;
  MsgImage(this.msg);

  @override
  Widget build(BuildContext context) {
    return Image.network("https://bing.nanxiongnandi.com/202204/NorwayBoulder_1920x1080.jpg");
  }
}
