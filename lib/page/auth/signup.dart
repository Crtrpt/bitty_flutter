import 'package:dino/i18n/default.i18n.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        stops: [0.2, 0.5, 0.8, 0.7],
        colors: [Colors.blue[50]!, Colors.blue[100]!, Colors.blue[200]!, Colors.blue[300]!],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      )),
      child: Form(
          child: Stack(
        children: [
          // Positioned(
          //   top: 0,
          //   bottom: 0,
          //   child: Image.network("https://bing.nanxiongnandi.com/202204/NorwayBoulder_1920x1080.jpg"),
          // ),
          Positioned(
              child: Padding(
            padding: EdgeInsets.only(top: 240, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: Icon(Icons.check),
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                      ),
                      hintText: 'inputYourAccount'.i18n),
                ),
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          // borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                          ),
                      hintText: 'inputYourPassword'.i18n),
                ),
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.email),
                      suffixIcon: Icon(Icons.email),
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                      ),
                      hintText: 'inputYourEmail'.i18n),
                ),
                Row(
                  children: [Checkbox(value: false, onChanged: (v) {}), Text("agreeLicense".i18n)],
                ),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        fixedSize: const Size(
                          500,
                          45,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/home");
                      },
                      child: Text("signupBtn".i18n, style: TextStyle(fontSize: 20))),
                )
              ],
            ),
          )),
        ],
      )),
    ));
  }
}
