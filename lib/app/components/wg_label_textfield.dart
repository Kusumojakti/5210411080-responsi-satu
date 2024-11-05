import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsi_satu/app/resources/palletes.dart';

class WgLabelTextfield extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obsecure;
  final bool readOnly;
  final bool enabled;
  final String? hintText;
  final Widget? suffix;
  final Widget? prefix;
  final bool isMulti;
  final String? label;
  final bool isRequired;
  final int? minLines;
  final Color? fieldFill;
  final Color? enabledBorderColor;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final bool expands;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isDense;
  final TextAlign textAlign;
  final Function()? onTap;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final Function(PointerDownEvent)? onTapOutside;
  final double? fieldHeight;
  final bool addLabel;
  final dynamic obscureText;
  const WgLabelTextfield({
    super.key,
    this.validator,
    required this.controller,
    required this.keyboardType,
    this.obsecure = false,
    this.readOnly = false,
    this.enabled = true,
    this.addLabel = true,
    this.hintText,
    this.suffix,
    this.prefix,
    this.isMulti = false,
    this.label,
    this.isRequired = false,
    this.minLines = 4,
    this.fieldFill,
    this.enabledBorderColor,
    this.inputFormatters,
    this.maxLength,
    required this.expands,
    this.contentPadding,
    this.isDense,
    required this.textAlign,
    this.onTap,
    this.focusNode,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onTapOutside,
    this.fieldHeight,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addLabel
              ? Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: label,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0,
                        ),
                      ),
                      TextSpan(
                        text: isRequired == true ? ' *' : '',
                        style: GoogleFonts.poppins(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
          addLabel ? const SizedBox(height: 7) : Container(),
          // Container(
          //   // height: fieldHeight ?? 50,
          //   child:
          TextFormField(
            textAlignVertical: TextAlignVertical.center,
            focusNode: focusNode,
            // controller: controller,
            keyboardType: keyboardType,
            obscureText: obsecure,
            readOnly: readOnly,
            enabled: enabled,
            validator: validator,
            // cursorColor: fieldCursor,
            style: GoogleFonts.dmSans(
              // color: fieldText,
              fontStyle: FontStyle.normal,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: enabledBorderColor ?? Colors.blue,
                ),
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(5.0),
                  right: Radius.circular(5.0),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: primaryColor,
                ),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(5.0),
                  right: Radius.circular(5.0),
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(5.0),
                  right: Radius.circular(5.0),
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: primaryColor,
                ),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(5.0),
                  right: Radius.circular(5.0),
                ),
              ),
              hintText: hintText,
              alignLabelWithHint: true,
              hintStyle: GoogleFonts.poppins(
                color: Colors.grey,
                fontStyle: FontStyle.normal,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                letterSpacing: 0,
              ),
              fillColor: fieldFill,
              filled: true,
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10.0,
                  ),
              prefixIcon: prefix,
              suffixIcon: suffix,
              isDense: isDense,
            ),
            minLines: isMulti ? minLines : 1,
            maxLines: isMulti ? null : 1,
            onTap: onTap,
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
            onFieldSubmitted: onFieldSubmitted,
            onTapOutside: onTapOutside,
            inputFormatters: inputFormatters,
            maxLength: maxLength,
            expands: expands,
            textAlign: textAlign,
            buildCounter: (
              BuildContext context, {
              int? currentLength,
              int? maxLength,
              bool? isFocused,
            }) {
              return null; // This hides the character counter
            },
          ),
          // ),
        ],
      ),
    );
  }
}
