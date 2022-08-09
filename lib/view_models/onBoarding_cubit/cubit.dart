import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muscatnature/models/onBoarding_model.dart';
import 'package:muscatnature/view_models/onBoarding_cubit/states.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingStates());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  PageController controller = PageController();

  bool isLast = false;

  int index = 0;

  onChangeIndex(int value) {
    index = value;
    emit(OnNextRegistrationStep());
  }

  List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
      title: "Welcome to Muscat Nature",
      image: "assets/img/welcome.svg",
      subTitle:
          "Muscat Nature is a domestic, inbound tour company, located in Muscat, Oman, established in 2007 .",
    ),
    OnBoardingModel(
      title: "Book Online Private Tours!",
      image: "assets/img/trip.svg",
      subTitle:
          "On the edge of the Arabian Peninsula, the state of Oman boasts lush wadis, diverse markets and rich culture.",
    ),
    OnBoardingModel(
      title: "Book Your Professional Driver!",
      image: "assets/img/driver.svg",
      subTitle:
          "Start your Oman vacation with confidence and free of stress knowing that a private driver will be waiting for you.",
    ),
  ];

  onBackStep() {
    index -= 1;
    isLast = false;
    emit(OnBackRegistrationStep());

    controller.previousPage(
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  onNextStep() {
    index += 1;
    if (index == 2) {
      isLast = true;
    }
    emit(OnNextRegistrationStep());
    controller.nextPage(
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.fastLinearToSlowEaseIn);
  }
}
