import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muscatnature/theme/app_theme.dart';
import 'package:muscatnature/view_models/onBoarding_cubit/cubit.dart';
import 'package:muscatnature/views/starting_screens/onBoarding_screen.dart';

void main() {
  runApp(const MuscatNature());
}

class MuscatNature extends StatelessWidget {
  const MuscatNature({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => OnBoardingCubit()),        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.theme,
        home: const OnBoardingScreen(),
      ),
    );
  }
}
