import 'package:education_app/core/extensions/context_extension.dart';
import 'package:education_app/core/res/colours.dart';
import 'package:education_app/core/res/fonts.dart';
import 'package:education_app/src/on_boarding/domain/page_content.dart';
import 'package:education_app/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key, required this.pageContent});
  final PageContent pageContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(pageContent.image,height: context.height * 0.4,),
        SizedBox(height: context.height * .03,),
        Padding(
          padding: const EdgeInsets.all(20).copyWith(bottom: 0),
          child: Column(
            children: [
              Text(pageContent.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 40,
                  fontFamily: Fonts.aeonik,
                  fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(height: context.height*.02,),
              Text(pageContent.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize:14)
              ),
              SizedBox(height: context.height*0.05,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:const EdgeInsets.symmetric(horizontal: 50,vertical: 17),
                  backgroundColor: Colours.primaryColour,
                  foregroundColor: Colors.white
                ),
                onPressed: () async {

                  context.read<OnBoardingCubit>().cacheFirstTimer();
                  // TODO (Get-Started)
                }, 
                child: Text('Get Started',
                    style:TextStyle(
                      fontFamily: Fonts.aeonik,
                      fontWeight: FontWeight.bold

                    )
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}