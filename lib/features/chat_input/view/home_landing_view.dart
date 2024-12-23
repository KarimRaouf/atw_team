import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mkag/features/chat_input/view/widgets/ball_tile_component.dart';
import 'package:mkag/generated/assets.dart';
import 'package:mkag/shared/widgets/custom_text_field.dart';

import '../../../shared/utils/app_ui.dart';

class HomeLandingView extends StatelessWidget {
  const HomeLandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(tileMode: TileMode.mirror ,colors:[Color(0xFF254642),Color(0xFF141414)]),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                spacing: 30,
                children: [
                  const SizedBox(height: 30,),
                  SvgPicture.asset(Assets.assetsAtLogo,height: 80,),
                  const SizedBox(height: 30,),
                  BallTileComponent(icon: Icons.article_outlined, title: 'Article Generator',onPress: (){},),
                  BallTileComponent(icon: Icons.find_in_page, title: 'Doc Search',onPress: (){}),
                  BallTileComponent(icon: Icons.lan_outlined, title: 'Path Finder',onPress: (){},)
                  // CustomTextField(
                  //   borderColor: const Color(0xFF40F99B),
                  //   fillColor: AppUI.greyD9,
                  //     controller: TextEditingController(), textInputType: TextInputType.text
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
