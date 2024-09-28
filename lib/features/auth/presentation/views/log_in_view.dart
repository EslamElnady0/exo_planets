import 'package:exo_planets/core/DI/dependency_injection.dart';
import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/widgets/custom_scaffold.dart';
import 'package:exo_planets/features/auth/presentation/view%20models/login%20ano%20cubit/login_ano_cubit.dart';
import 'package:exo_planets/features/auth/presentation/view%20models/login%20cubit/login_cubit.dart';
import 'package:exo_planets/features/auth/presentation/views/widgets/log_in_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<LoginCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<LoginAnoCubit>(),
          ),
        ],
        child: const LogInViewBody(),
      ),
      backgroundImage: AppAssets.signInUpBackground,
    );
  }
}
