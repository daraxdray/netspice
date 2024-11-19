import 'package:flutter/material.dart';
import 'package:my_tom/core/app_exports.dart';
import 'package:my_tom/widgets/base_button.dart';


class CustomOutlinedButton extends BaseButton {
  CustomOutlinedButton({
    Key? key,
    this.layoutSeperated = false, 
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.label,
    ButtonStyle? buttonStyle,
    VoidCallback? onPressed,
    TextStyle? buttonTextStyle,
    bool? isDisabled,
    Alignment? alignment,
    double? height,
    double? width,
    EdgeInsets? margin,
    required String text,
  }) : super(
          text: text,
          onPressed: onPressed,
          buttonStyle: buttonStyle,
          isDisabled: isDisabled,
          buttonTextStyle: buttonTextStyle,
          height: height,
          width: width,
          alignment: alignment,
          margin: margin,
        );

  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final bool layoutSeperated;
  final Widget? label;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildOutlinedButtonWidget,
          )
        : buildOutlinedButtonWidget;
  }

  Widget get buildOutlinedButtonWidget => Container(
        height: this.height ?? 25,
        width: this.width ?? double.maxFinite,
        margin: margin,
        decoration: decoration,
        child: OutlinedButton(
          style: buttonStyle,
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          child: !layoutSeperated
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    leftIcon ?? const SizedBox.shrink(),
                    Text(
                      text,
                      style: buttonTextStyle ??
                          CustomTextStyles.buttonDark
                              .copyWith(fontWeight: FontWeight.w600),
                    ),
                    rightIcon ?? const SizedBox.shrink(),
                  ],
                )
              :  Padding(padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        leftIcon ?? const SizedBox.shrink(),
                        Text(
                          text,
                          style: buttonTextStyle ??
                              CustomTextStyles.buttonDark
                                  .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    rightIcon ?? const SizedBox.shrink(),
                  ],
                ),)
        ),
      );
}
