import 'package:flutter/material.dart';

import '_endpoint_avatar.dart';

class EndpointCard extends StatelessWidget {
  var endpoint;

  EndpointCard(this.endpoint);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {Navigator.pushNamed(context, "/user/chart")},
        child: Container(
          color: endpoint["is_pin"] ? Colors.black12 : Colors.white,
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Flex(direction: Axis.horizontal, children: [
            EndpointAvatar(endpoint),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        child: Text(
                          endpoint['name']!,
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                        ),
                      ),
                      Text(
                        endpoint['last_time']!,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  )),
                  Text(
                    endpoint['last_msg']!,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  )
                ],
              ),
            )),
          ]),
        ));
  }
}
