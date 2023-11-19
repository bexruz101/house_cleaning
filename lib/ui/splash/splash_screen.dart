import 'package:cleaning_house/cubits/auth/auth_cubit.dart';
import 'package:cleaning_house/utils/app_routes.dart';
import 'package:cleaning_house/utils/colors.dart';
import 'package:cleaning_house/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _init1() async {
    await Future.delayed(const Duration(seconds: 3), () async {
      Navigator.pushReplacementNamed(context, RouteNames.onboardingScreen);
    });
  }

  Future<void> _init2() async {
    await Future.delayed(const Duration(seconds: 3), () async {
      Navigator.pushReplacementNamed(context, RouteNames.tabBoxScreen);
    });
  }

  @override
  void initState() {
    BlocProvider.of<AuthCubit>(context).checkLoggedState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.C_0FC36D,
        body: BlocListener<AuthCubit, AuthState>(
          child: Center(
            child: Image.asset(AppImages.cleaninglogo),
          ),
          listener: ((context, state) {
            if (state is AuthUnAuthenticatedState) {
              _init1();
            }
            if (state is AuthLoggedState) {
              _init2();
            }
          }),
        ));
  }
}
