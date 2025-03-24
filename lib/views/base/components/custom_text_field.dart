import 'package:flutter/material.dart';
import '../../../utilities/app_colors.dart';

class MyTextFormFieldWithIcon extends StatefulWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final bool readOnly;
  final String formHintText;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyBoardType;

  const MyTextFormFieldWithIcon({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    required this.formHintText,
    this.controller,
    this.onChanged,
    this.validator,
    this.keyBoardType,
    this.hintStyle,
    this.readOnly = false,
  });

  @override
  _MyTextFormFieldWithIconState createState() => _MyTextFormFieldWithIconState();
}

class _MyTextFormFieldWithIconState extends State<MyTextFormFieldWithIcon> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyBoardType,
      readOnly: widget.readOnly,
      obscureText: widget.isPassword ? _obscureText : false,
      textInputAction: TextInputAction.next,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintStyle: widget.hintStyle,
        hintText: widget.formHintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon ?? _buildDefaultSuffixIcon(),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      ),
      validator: widget.validator,
    );
  }

  /// Default suffix icon for password toggle
  Widget? _buildDefaultSuffixIcon() {
    if (!widget.isPassword) return null;
    return IconButton(
      icon: Icon(_obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }
}
