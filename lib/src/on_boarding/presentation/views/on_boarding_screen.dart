import 'package:education_app/core/common/views/loading_view.dart';
import 'package:education_app/core/common/widget/gradient_background.dart';
import 'package:education_app/core/res/colours.dart';
import 'package:education_app/core/res/media_res.dart';
import 'package:education_app/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:education_app/src/on_boarding/presentation/cubit/on_boarding_state.dart';
import 'package:education_app/src/on_boarding/presentation/widgets/on_boarding_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../domain/page_content.dart';
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static const routeName = '/';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageController = PageController();
  @override
  void initState() {
    context.read<OnBoardingCubit>().checkingIfUserIsFirstTimer();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: GradientBackground(
        image: MediaRes.onBoardingBackground,
        child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
          listener: (context, state) {
            if(state is OnBoardingStatus&& !state.isFirstTimer){
              Navigator.pushReplacementNamed(context, '/home');
            }else if(state is UserCached){
              // TODO  login page -- user cache handler
                Navigator.pushReplacementNamed(context, '/');
            }
          },
          builder: (context,state){
            if(state is CheckingIfUserIsFirstTimer || state is CachingFirstTimer ){
              return const LoadingView();
            }
            return GradientBackground(
              image: MediaRes.onBoardingBackground,
              child: Stack(children: [
                PageView(controller: pageController,
                  children: [
                    OnBoardingBody(pageContent:PageContent.first()),
                    OnBoardingBody(pageContent:PageContent.second()),
                    OnBoardingBody(pageContent:PageContent.third())
                  ],
                ),
                Align(alignment: const Alignment(0,0.04),
                  child:SmoothPageIndicator(controller: pageController, count: 3, onDotClicked:(index){
                    pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                  } ,
                    effect: WormEffect(
                      dotHeight: 10,dotWidth: 10,spacing: 40,activeDotColor: Colours.primaryColour,
                      dotColor: Colors.white
                    ),
                  )
                )
              
              ],),);
          },
        ),
      ),
    );
  }
}