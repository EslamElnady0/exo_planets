import 'package:flutter/material.dart';
import '../../../../core/helpers/app_assets.dart';
import '../../../../core/theme/app_text_styles.dart';

class CustomNavigationRow extends StatelessWidget {
  final String title;    
  final String subtitle;   
  final VoidCallback onPreviousPage; 
  final VoidCallback onNextPage;     

  const CustomNavigationRow({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onPreviousPage,
    required this.onNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          iconSize: 50.0, 
          icon: Image.asset(AppAssets.leftbuttonIcon),
          onPressed: onPreviousPage, 
        ),
        Column(
          children: [
            Text(
              title,  
              style: AppTextStyles.font28VeryLightGrayW500,
            ),
            Text(
              subtitle,
              style: AppTextStyles.font12LightGrayW400,
            ),
          ],
        ),
        IconButton(
          iconSize: 50.0, 
          icon: Image.asset(AppAssets.rightbuttonIcon), 
          onPressed: onNextPage, 
        ),
      ],
    );
  }
}