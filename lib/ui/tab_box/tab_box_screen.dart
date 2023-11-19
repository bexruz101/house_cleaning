import 'package:cleaning_house/cubits/auth/auth_cubit.dart';
import 'package:cleaning_house/ui/tab_box/account/account_screen.dart';
import 'package:cleaning_house/ui/tab_box/comment/comment_screen.dart';
import 'package:cleaning_house/ui/tab_box/saved/saved_screen.dart';
import 'package:cleaning_house/ui/tab_box/search/search_screen.dart';
import 'package:cleaning_house/ui/tab_box/service/service_screen.dart';
import 'package:cleaning_house/utils/app_routes.dart';
import 'package:cleaning_house/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../cubits/tab/tab_box.dart';
import '../../utils/colors.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({super.key});

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  List<Widget> _screens = [];

  @override
  void initState() {
    _screens = [
      const ServiceScreen(),
      const SavedScreen(),
      const SearchScreen(),
      const CommentScreen(),
      const AccountScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   var currentIndex =  context.watch<TabCubit>();
    return Scaffold(
      body: BlocListener<AuthCubit,AuthState>(
        child: IndexedStack(
          index: context.watch<TabCubit>().state,
          children: _screens,
        ),
        listener: (context,state){
          if(state is AuthUnAuthenticatedState){
            Navigator.pushReplacementNamed(context, RouteNames.onboardingScreen);
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: context.watch<TabCubit>().state,
        onTap: context.read<TabCubit>().changeTabIndex,
        items:  [
          BottomNavigationBarItem(icon: currentIndex.state == 0 ?SvgPicture.asset(AppImages.glist): SvgPicture.asset(AppImages.list),label: ''),
          BottomNavigationBarItem(icon: currentIndex.state == 1 ?SvgPicture.asset(AppImages.gfavorite): SvgPicture.asset(AppImages.favorite),label: ''),
          BottomNavigationBarItem(icon: currentIndex.state == 2 ? Container(padding: EdgeInsets.all(10),height: 50,width: 50, decoration: BoxDecoration(color: AppColors.C_0FC36D,shape: BoxShape.circle),child: SvgPicture.asset(AppImages.wsearch)):Container(padding: EdgeInsets.all(10),height: 50,width: 50, decoration: BoxDecoration(shape: BoxShape.circle),child: SvgPicture.asset(AppImages.search)),label: ''),
          BottomNavigationBarItem(icon:currentIndex.state == 3 ?SvgPicture.asset(AppImages.gmail):  SvgPicture.asset(AppImages.mail),label: ''),
          BottomNavigationBarItem(icon: currentIndex.state == 4 ?SvgPicture.asset(AppImages.gaccount): SvgPicture.asset(AppImages.account),label: ''),
        ],
      ),
    );
  }
}
