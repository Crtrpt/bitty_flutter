import 'package:flutter/material.dart';

// ignore: top_level_function_literal_block

class Endpoint extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _endpointState();
}

class _endpointState extends State<Endpoint> {
  var endpointList = [];

  var getEndpointList = () {
    List<Map<String, dynamic>> list = [];
    for (var i = 0; i < 20; i++) {
      list.add({"id": i, "name": "xx" + i.toString(), "last_msg": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", "last_time": "20:20"});
    }
    return list;
  };
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.endpointList = this.getEndpointList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("列表(" + endpointList.length.toString() + ")"),
        actions: [
          IconButton(
              icon: Icon(Icons.qr_code),
              onPressed: () {
                Navigator.pushNamed(context, "/tool/qrscan");
              })
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, idx) {
            return ListTile(
              onTap: () {
                Navigator.pushNamed(context, "/user/chart");
              },
              contentPadding: EdgeInsets.fromLTRB(10, 5, 5, 10),
              leading: Image.network("https://api.multiavatar.com/" + endpointList[idx]['name'] + ".png"),
              title: Text(endpointList[idx]['name']!),
              subtitle: Text(endpointList[idx]['last_msg']!),
            );
          },
          itemCount: endpointList.length,
        ),
      ),
    );
  }
}
