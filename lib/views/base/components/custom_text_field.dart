import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utilities/app_colors.dart';

class MyTextFormFieldWithIcon extends StatefulWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final String formHintText;
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
  });

  @override
  _MyTextFormFieldWithIconState createState() =>
      _MyTextFormFieldWithIconState();
}

class _MyTextFormFieldWithIconState extends State<MyTextFormFieldWithIcon> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.textFieldBorderColor, width: 1.w),
      ),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyBoardType,
        obscureText: widget.isPassword ? _obscureText : false,
        textInputAction: TextInputAction.next,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: widget.formHintText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon ?? _buildDefaultSuffixIcon(),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        ),
        validator: widget.validator,
      ),
    );
  }

  /// Default suffix icon for password toggle
  Widget? _buildDefaultSuffixIcon() {
    if (!widget.isPassword) return null;
    return IconButton(
      icon: Icon(
        _obscureText ? Icons.visibility_off : Icons.visibility,
        color: AppColors.primaryColor,
      ),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }
}
