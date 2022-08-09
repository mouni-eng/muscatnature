import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:muscatnature/size_config.dart';
import 'package:muscatnature/view_models/onBoarding_cubit/cubit.dart';
import 'package:muscatnature/view_models/onBoarding_cubit/states.dart';
import 'package:muscatnature/views/components/base_widget.dart';
import 'package:muscatnature/views/components/components/custom_button.dart';
import 'package:muscatnature/views/components/components/custom_text.dart';
import 'package:muscatnature/views/components/components/onBoarding_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: RentXWidget(
        builder: (rentxcontext) => SafeArea(
            child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  OnBoardingCubit cubit = OnBoardingCubit.get(context);
                  var color = rentxcontext.theme.customTheme;
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: width(16),
                      vertical: height(25),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: PageView.builder(
                            controller: cubit.controller,
                            onPageChanged: (int index) {
                              cubit.onChangeIndex(index);
                            },
                            physics: const BouncingScrollPhysics(),
                            itemCount: cubit.onBoardingList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return OnBoardingBuilder(
                                  model: cubit.onBoardingList[index]);
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmoothPageIndicator(
                              controller: cubit.controller,
                              count: 3,
                              effect: ExpandingDotsEffect(
                                dotColor: color.kSecondaryColor,
                                activeDotColor: color.secondary,
                                dotHeight: height(7),
                                expansionFactor: 4,
                                dotWidth: width(7),
                                spacing: 5.0,
                              ),
                            ),
                            if (cubit.index != 2)
                              TextButton(
                                  onPressed: () {
                                    cubit.onNextStep();
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: CustomText(
                                    fontSize: width(18),
                                    color: color.secondary,
                                    text: "Next",
                                  )),
                            if (cubit.index == 2)
                              CustomButton(
                                btnHeight: height(40),
                                btnWidth: width(150),
                                fontSize: width(18),
                                background: color.secondary,
                                radius: 8,
                                fontWeight: FontWeight.w400,
                                function: () {
                                  if (cubit.index != 2) {
                                    cubit.onNextStep();
                                  } else {
                                    //rentxcontext.route((context) => const LogInView());

                                  }
                                },
                                text: "Get started",
                              ),
                          ],
                        )
                      ],
                    ),
                  );
                })),
      ),
    );
  }
}
