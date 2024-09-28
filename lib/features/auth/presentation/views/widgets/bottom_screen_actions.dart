import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes/app_router.dart';
import '../../view models/login ano cubit/login_ano_cubit.dart';

class BottomScreenActions extends StatelessWidget {
  final bool backExists;
  final bool skipExists;
  const BottomScreenActions(
      {super.key, required this.backExists, required this.skipExists});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        backExists
            ? GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 22.r,
                    ),
                    Text("Back", style: AppTextStyles.font15WhiteW500),
                  ],
                ),
              )
            : const SizedBox(),
        const Spacer(),
        skipExists
            ? GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  await context.read<LoginAnoCubit>().loginAno();
                  if (context.mounted) {
                    context.pushNamedAndRemoveUntil(AppRouter.home,
                        predicate: (_) => false);
                  }
                },
                child: Row(
                  children: [
                    Text("Skip", style: AppTextStyles.font15WhiteW500),
                    SizedBox(
                      width: 3.w,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 22.r,
                    ),
                  ],
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
