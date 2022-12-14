import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muscatnature/models/onBoarding_model.dart';
import 'package:muscatnature/size_config.dart';
import 'package:muscatnature/views/components/base_widget.dart';
import 'package:muscatnature/views/components/components/custom_text.dart';

class OnBoardingBuilder extends StatelessWidget {
  const OnBoardingBuilder({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return RentXWidget(
      builder: (rentxcontext) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height(100),
          ),
          Center(
            child: SvgPicture.asset(
              model.image!,
              width: width(300),
              height: height(300),
            ),
          ),
          SizedBox(
            height: height(50),
          ),
          CustomText(
            fontSize: width(20),
            text: model.title!,
            fontWeight: FontWeight.w600,
            color: rentxcontext.theme.customTheme.headline,
          ),
          SizedBox(
            height: height(10),
          ),
          CustomText(
            fontSize: width(16),
            maxlines: 5,
            height: 1.4,
            text: model.subTitle!,
            color: rentxcontext.theme.customTheme.headline3,
          ),
        ],
      ),
    );
  }
}
