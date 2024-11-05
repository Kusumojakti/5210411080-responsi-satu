import 'package:flutter/material.dart';
import 'package:responsi_satu/app/resources/palletes.dart';

class WgButton extends StatelessWidget {
  final String btnText;
  final Function? onTap;
  final Color? btnColor;
  final Gradient? btnGradient;
  final Color? txtColor;
  final TextStyle textStyle;
  const WgButton({
    super.key,
    required this.btnText,
    required this.onTap,
    this.btnColor,
    this.txtColor,
    required this.textStyle,
    this.btnGradient,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: onTap as void Function()?,
      onTap: onTap != null ? () => onTap!() : null,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
        child: Container(
          height: 55,
          width: 218,
          decoration: BoxDecoration(
            color: btnColor ?? primaryColor,
            gradient: btnGradient,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              btnText,
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
