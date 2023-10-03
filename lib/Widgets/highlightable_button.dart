import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HighlightableButton extends StatefulWidget {
  @override
  HighlightableButtonState createState() => HighlightableButtonState();
}

class HighlightableButtonState extends State<HighlightableButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromRGBO(241, 241, 241, 1),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Stack(children: [
        Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/images/sort.svg",
              fit: BoxFit.scaleDown,
            )),
        Align(
            alignment: Alignment.bottomRight,
            child: Padding(
                padding: const EdgeInsets.only(bottom: 5, right: 5),
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                )))
      ]),
    );
  }
}
