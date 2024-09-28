import 'package:exo_planets/core/DI/dependency_injection.dart';
import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/widgets/custom_scaffold.dart';
import 'package:exo_planets/features/auth/presentation/view%20models/send%20password%20reset%20cubit/send_password_reset_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/forgot_password_view_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundImage: AppAssets.signInUpBackground,
      body: BlocProvider(
        create: (context) => getIt<SendPasswordResetCubit>(),
        child: const ForgotPasswordViewBody(),
      ),
    );
  }
}
