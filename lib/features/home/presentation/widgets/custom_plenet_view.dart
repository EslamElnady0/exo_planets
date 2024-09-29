import 'package:flutter/material.dart';
import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:exo_planets/features/home/data/static/static_planet_data.dart';


class CustomPlanetView extends StatelessWidget {
  final PageController pageController;

  const CustomPlanetView({
    super.key,
    required this.pageController,

  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SizedBox(
            width: 370,  
            height: 300, 
            child: AspectRatio(
              aspectRatio: 1, 
             
              child: Image.asset(
                 fit: BoxFit.fill,
                AppAssets.circleOfPlent),
            ),
          ),
        ),
        Positioned(
          top: 60,  
          right:120, 
          child: SizedBox(
            width: 172.8,  
            height: 172.8, 
            child: AspectRatio(
              aspectRatio: 1,
              child: PageView.builder(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: planetData.length, 
                itemBuilder: (context, index) {
                  return Flutter3DViewer(
                    src: planetData[index].model3DPath,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}