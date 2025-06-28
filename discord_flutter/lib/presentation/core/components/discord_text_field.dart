import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:discord_flutter/presentation/core/font_styles.dart';
import 'package:flutter/material.dart';

class DiscordTextField extends StatelessWidget {
  const DiscordTextField({
    super.key,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.textAlignVertical = TextAlignVertical.center,
    this.isDense = false,
    this.prefixIconConstraints = const BoxConstraints(minWidth: 48),
    this.suffixIconConstraints = const BoxConstraints(minWidth: 48),
    this.prefixIconPadding = const EdgeInsetsDirectional.only(start: 8),
    this.suffixIconPadding = const EdgeInsetsDirectional.only(end: 8),
    this.style,
    this.hintStyle,
    this.validator,
    this.fillColor,
  });

  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final int maxLines;
  final int minLines;
  final TextAlignVertical textAlignVertical;
  final bool isDense;
  final BoxConstraints prefixIconConstraints;
  final BoxConstraints suffixIconConstraints;
  final EdgeInsetsDirectional prefixIconPadding;
  final EdgeInsetsDirectional suffixIconPadding;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final Color? fillColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      textInputAction: textInputAction,
      autofocus: autofocus,
      style: style ?? locator<FontStyles>().chatStyle,
      maxLines: maxLines,
      minLines: minLines,
      textAlignVertical: textAlignVertical,
      decoration: InputDecoration(
        isDense: isDense,
        filled: true,
        fillColor: fillColor ?? ColorPalette.chatInputBackground,
        focusColor: fillColor,
        hoverColor: fillColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIconConstraints: prefixIconConstraints,
        suffixIconConstraints: suffixIconConstraints,
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: prefixIconPadding,
                child: prefixIcon,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: suffixIconPadding,
                child: suffixIcon,
              )
            : null,
        hintText: hintText,
        hintStyle: hintStyle ?? locator<FontStyles>().chatHintStyle,
      ),
    );
  }
}
