import 'package:dino/page/system/selectLanguage.dart';
import 'package:dino/page/system/selectTheme.dart';
import 'package:flutter/material.dart';

import 'cleanCache.dart';

class setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("系统设置"),
        actions: [],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [SelectLanguage(), SelectTheme(), CleanCache()],
        ),
      ),
    );
  }
}
