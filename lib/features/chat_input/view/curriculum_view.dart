import 'package:flutter/material.dart';
import 'package:mkag/shared/widgets/background_container.dart';
import 'package:mkag/shared/widgets/custom_text_field.dart';

import '../../../shared/utils/app_ui.dart';

class CurriculumScreen extends StatelessWidget {
  const CurriculumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent,title: const Text('Curriculum Generator',style: TextStyle(fontFamily: 'Gabarito',color: Colors.white),),),
      body: BackgroundContainer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                const SizedBox(height: 50,),
                SafeArea(
                    child: CustomTextField(
                        hint: 'Ask for Curriculum',
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
