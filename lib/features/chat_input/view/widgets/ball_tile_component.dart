import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../generated/assets.dart';

class BallTileComponent extends StatelessWidget {
  const BallTileComponent({super.key, required this.icon, required this.title, this.onPress});
  
  final IconData icon;
  final String title;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(icon,color: Colors.white,size: 50,),
              SvgPicture.asset(Assets.assetsGreenballFigure,width: 120,),
            ],
          ),
          Text(
            title,style:
          const TextStyle(
              fontFamily: 'Gabarito',
              fontSize: 24,
              fontWeight: FontWeight.w500
          ),)
        ],
      ),
    );
  }
}
