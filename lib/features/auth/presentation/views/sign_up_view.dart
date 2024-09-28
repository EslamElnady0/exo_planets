import 'package:exo_planets/core/DI/dependency_injection.dart';
import 'package:exo_planets/core/widgets/custom_scaffold.dart';
import 'package:exo_planets/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_assets.dart';
import '../view models/login ano cubit/login_ano_cubit.dart';
import '../view models/signup cubit/signup_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<SignupCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<LoginAnoCubit>(),
          ),
        ],
        child: const SignUpViewBody(),
      ),
      backgroundImage: AppAssets.signInUpBackground,
    );
  }
}
