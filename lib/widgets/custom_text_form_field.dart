import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tom/core/app_exports.dart';

extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get fillDeepOrange => OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide.none,
  );

  static OutlineInputBorder get underlineGray => OutlineInputBorder(
    borderSide: BorderSide.none,
  );
}

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.boxDecoration,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.disabled = false,
    this.validator, 
    this.onChanged,
    this.isPassword = false // New argument for password field


  }) : super(key: key);

  final Alignment? alignment;
  final double? width; 
  final Function? onChanged;
  final BoxDecoration? boxDecoration;
  final EdgeInsets? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final TextStyle? textStyle;
  final bool obscureText; 

  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool filled;
  final bool disabled;
  final FormFieldValidator<String>? validator;
  final bool isPassword; 

    final ValueNotifier<bool> _showPassword = ValueNotifier<bool>(false); // Use ValueNotifier


  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align( 
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => Container(
  width: width ?? double.maxFinite,
  decoration: boxDecoration,
  child: ValueListenableBuilder<bool>(
    valueListenable: _showPassword,
    builder: (context, showPassword, child) { return TextFormField(
    scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
    onChanged:(String? val)=>onChanged!(val),
    enabled: !disabled,
    controller: controller,
    focusNode: focusNode,
    onTapOutside: (event) {
      if (focusNode != null && !focusNode!.hasFocus) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
    },
    autofocus: autofocus,
    style: textStyle ?? theme.textTheme.bodyMedium?.copyWith(color: appTheme.black900),
    obscureText: isPassword ? !_showPassword.value : obscureText, // Toggle based on isPassword
    readOnly: readOnly!,
    onTap: () {
      onTap?.call();
    },
    textInputAction: textInputAction,
    keyboardType: textInputType,
    maxLines: maxLines ?? 1,
    decoration: decoration,
    validator: validator,
  );
  }
  ),
);

InputDecoration get decoration => InputDecoration(
  hintText: hintText,
  labelText: labelText,
  hintStyle: hintStyle ?? CustomTextStyles.formLabel,
  labelStyle: labelStyle ?? CustomTextStyles.formLabel,
  prefixIcon: prefix,
  floatingLabelBehavior: FloatingLabelBehavior.auto, // Automatically floats label
  prefixIconConstraints: prefixConstraints,
  suffixIcon: isPassword ? _buildPasswordSuffixIcon() : suffix, // Show suffix icon only if isPassword
  suffixIconConstraints: suffixConstraints,
  isDense: true,
  contentPadding: contentPadding ??EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  fillColor: fillColor ?? appTheme.gray10003,
  filled: filled,
  border: borderDecoration ??
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide.none,
      ),
  enabledBorder: borderDecoration ??
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide.none,
      ),
  focusedBorder: borderDecoration ??
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ).copyWith(
        borderSide: BorderSide(
          color: theme.colorScheme.primary,
          width: 1,
        ),
      ),
  errorBorder: borderDecoration ??
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ).copyWith(
        borderSide: BorderSide(
          color: appTheme.redA400,
        ),
      ),
  focusedErrorBorder: borderDecoration ??
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
      ).copyWith(
        borderSide: BorderSide(
          color: appTheme.redA400,
        ),
      ),
  errorStyle: TextStyle(
    color: appTheme.redA400,
    fontSize: 6,
  ),
);


 Widget _buildPasswordSuffixIcon() {
    return ValueListenableBuilder<bool>(
      valueListenable: _showPassword,
      builder: (context, showPassword, child) {
        return IconButton(
          onPressed: () {
            _showPassword.value = !_showPassword.value;
          },
          icon: Icon(
            showPassword ? Icons.visibility_off : Icons.visibility,
            color: appTheme.gray500,
          ),
        );
      },
    );
}

}