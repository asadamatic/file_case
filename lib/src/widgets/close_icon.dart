import 'package:flutter/material.dart';

class CloseIcon extends StatelessWidget {
  const CloseIcon({Key? key, this.onTap}) : super(key: key);

  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: const Align(
        alignment: Alignment.topRight,
        child: CircleAvatar(
          foregroundColor: Colors.red,
          radius: 10.0,
          backgroundColor: Color(0xffFF544E),
          child: Icon(
            Icons.close,
            color: Colors.white,
            size: 10.0,
          ),
        ),
      ),
    );
  }
}
