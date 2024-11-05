import 'package:flutter/material.dart';
import 'package:responsi_satu/app/resources/palletes.dart';

class WgAlertResponseButton extends StatelessWidget {
  final Icon? icon;
  final String? title;
  final String? subtitle;
  final String? buttontext;
  final Function onPressed;
  const WgAlertResponseButton({
    super.key,
    this.icon,
    this.title,
    this.subtitle,
    this.buttontext,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Material(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50,
                child: icon,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "$title",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "$subtitle",
                style: const TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor.withOpacity(0.15),
                  minimumSize: const Size(double.infinity, 25),
                ),
                onPressed: onPressed as void Function()?,
                child: Text(
                  "$buttontext",
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
