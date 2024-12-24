import 'package:flutter/material.dart';
import 'package:mkag/shared/widgets/background_container.dart';
import 'package:mkag/shared/widgets/custom_text_field.dart';

import '../../../shared/utils/app_ui.dart';

class PathFinderScreen extends StatelessWidget {
  const PathFinderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent,title: const Text('Path Finder',style: TextStyle(fontFamily: 'Gabarito',color: Colors.white),),),
      body: BackgroundContainer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                const SizedBox(height: 50,),
                SafeArea(
                    child: CustomTextField(
                        hint: 'Ask about a roadmap',
                        fillColor: AppUI.greyD9,
                        borderColor: AppUI.green9B,
                        controller: TextEditingController(), textInputType: TextInputType.text)
                )
              ],
            ),
          )
      ),
    );
  }
}
