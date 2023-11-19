import 'package:cleaning_house/ui/onboarding/widgets/dots.dart';
import 'package:cleaning_house/ui/onboarding/widgets/page_content.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';
import '../../utils/app_routes.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  onPageChanged: (index) {
                    setState(() {});
                    currentIndex = index;
                  },
                  children: [
                    PageContent(
                        mainImage: AppImages.p1,
                        mainText: '',
                        text:
                            'next'),
                    PageContent(
                        mainImage: AppImages.p2,
                        mainText: '',
                        text:
                            'next'),
                    PageContent(
                        mainImage: AppImages.p3,
                        mainText: '',
                        text:
                            'next'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Dots(num: currentIndex),
                ],
              ),
              SizedBox(
                height: 35 / 812 * height,
              ),
              Ink(
                width: width / 1.3,
                height: 40 / 812 * height,
                decoration: BoxDecoration(
                    color: AppColors.C_0FC36D,
                    borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () async {
                    SharedPreferences store = await prefs;
                    store.setBool('sasa', true);
                    Navigator.pushReplacementNamed(
                        context, RouteNames.registerScreen);
                  },
                  child: Center(
                      child: Text(
                    'startt',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.white),
                  )),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ));
  }
}
