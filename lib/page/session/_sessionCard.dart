import 'package:flutter/material.dart';

import '_session_avatar.dart';

class SessionCard extends StatelessWidget {
  var session;

  SessionCard(this.session);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {Navigator.pushNamed(context, "/session/chat")},
        child: Container(
          color: session["is_pin"] ? Colors.black12 : Colors.white,
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Flex(direction: Axis.horizontal, children: [
            SessionAvatar(session),
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
                          session['name']!,
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                        ),
                      ),
                      Text(
                        session['last_time']!,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  )),
                  Text(
                    session['last_msg']!,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  )
                ],
              ),
            )),
          ]),
        ));
  }
}
