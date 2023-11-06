import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_flutter/custom_theme.dart';

class HighlightableButton extends StatefulWidget {
  final Function() onTap;
  final bool isHightlighted;

  const HighlightableButton(
      {super.key, required this.onTap, required this.isHightlighted});

  @override
  HighlightableButtonState createState() => HighlightableButtonState();
}

class HighlightableButtonState extends State<HighlightableButton> {
  @override
  Widget build(BuildContext context) {
    final CustomColors colors = Theme.of(context).extension<CustomColors>()!;
    return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
              color: colors.alyaska,
              borderRadius: const BorderRadius.all(Radius.circular(6))),
          child: Stack(children: [
            Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  "assets/images/sort.svg",
                  fit: BoxFit.scaleDown,
                )),
            if (widget.isHightlighted)
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
        ));
  }
}
