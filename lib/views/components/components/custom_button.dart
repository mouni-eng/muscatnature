import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muscatnature/size_config.dart';
import 'package:muscatnature/views/components/base_widget.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final double? btnWidth;
  final double? btnHeight;
  final Color? background;
  final bool? isUpperCase;
  final double? radius;
  final double? fontSize;
  final Function()? function;
  final String? text;
  final String? svgLeadingIcon;
  final bool? showLoader;
  final bool? enabled;
  final FontWeight? fontWeight;

  const CustomButton({
    Key? key,
    this.btnWidth = double.infinity,
    this.background,
    this.radius = 6.0,
    required this.fontSize,
    this.isUpperCase = false,
    required this.function,
    required this.text,
    this.svgLeadingIcon,
    this.showLoader = false,
    this.btnHeight = 48,
    this.enabled = true,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RentXWidget(builder: (rentxcontext) {
      var bgColor = background ?? rentxcontext.theme.customTheme.primary;
      return Container(
        width: btnWidth,
        height: btnHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            radius!,
          ),
          color: showLoader! || !enabled! ? bgColor.withOpacity(0.3) : bgColor,
        ),
        child: MaterialButton(
            onPressed: showLoader! || !enabled! ? null : function,
            child: _rowWidget(rentxcontext)),
      );
    });
  }

  Widget _rowWidget(RentXContext rentXContext) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (svgLeadingIcon != null)
          SvgPicture.asset(
            svgLeadingIcon!,
            color: rentXContext.theme.customTheme.onPrimary,
          ),
        if (svgLeadingIcon != null)
          SizedBox(
            width: width(14),
          ),
        if (showLoader!)
          SizedBox(
              width: height(btnHeight! * 0.7),
              height: height(btnHeight! * 0.7),
              child: CircularProgressIndicator.adaptive(
                backgroundColor: rentXContext.theme.customTheme.onPrimary,
              )),
        if (showLoader!)
          SizedBox(
            width: width(14),
          ),
        _textWidget(rentXContext)
      ],
    );
  }

  Widget _textWidget(RentXContext rentXContext) {
    return Expanded(
        child: Center(
      child: CustomText(
        text: isUpperCase! ? text!.toUpperCase() : text!,
        color: rentXContext.theme.customTheme.onPrimary,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontSize: fontSize!,
      ),
    ));
  }
}

class CustomNextButton extends StatelessWidget {
  const CustomNextButton({Key? key, this.background, required this.function})
      : super(key: key);

  final Color? background;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return RentXWidget(builder: (rentxcontext) {
      var bgColor = rentxcontext.theme.customTheme;
      return Container(
        width: width(45),
        height: height(45),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: background ?? bgColor.secondary,
        ),
        child: MaterialButton(
          padding: EdgeInsets.zero,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: function,
          child: Center(
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: bgColor.onPrimary,
              size: 16,
            ),
          ),
        ),
      );
    });
  }
}
