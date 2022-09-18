import 'package:flutter/material.dart';

class CheckBoxV1 extends StatefulWidget {
  CheckBoxV1({this.onChanged});
  Function? onChanged;
  @override
  State<StatefulWidget> createState() =>
      StateCheckBox(onChanged: this.onChanged);
}

class StateCheckBox extends State<CheckBoxV1> {
  StateCheckBox({this.onChanged});
  bool? value = false;
  Function? onChanged;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: value,
        onChanged: (v) {
          setState(() {
            this.value = v;
          });
          this.onChanged?.call(v);
        });
  }
}
