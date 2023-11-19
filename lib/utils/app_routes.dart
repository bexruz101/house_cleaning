import 'package:cleaning_house/ui/admin_panel/add_data/add_catalog_screen.dart';
import 'package:cleaning_house/ui/admin_panel/add_data/add_category_screen.dart';
import 'package:cleaning_house/ui/admin_panel/add_data/add_news.dart';
import 'package:cleaning_house/ui/admin_panel/add_data/add_partners.dart';
import 'package:cleaning_house/ui/admin_panel/add_data/add_service_info.dart';
import 'package:cleaning_house/ui/admin_panel/add_data/add_service_screen.dart';
import 'package:cleaning_house/ui/admin_panel/tab_box2.dart';
import 'package:cleaning_house/ui/auth/admin_login/admin_login_screen.dart';
import 'package:cleaning_house/ui/auth/gmail_verify/gmail_verify_screen.dart';
import 'package:cleaning_house/ui/auth/login_register_screen.dart';
import 'package:cleaning_house/ui/onboarding/on_boarding_screen.dart';
import 'package:cleaning_house/ui/splash/splash_screen.dart';
import 'package:cleaning_house/ui/tab_box/account/account_screen.dart';
import 'package:cleaning_house/ui/tab_box/comment/comment_screen.dart';
import 'package:cleaning_house/ui/tab_box/saved/saved_screen.dart';
import 'package:cleaning_house/ui/tab_box/search/search_screen.dart';
import 'package:cleaning_house/ui/tab_box/service/service_screen.dart';
import 'package:cleaning_house/ui/tab_box/tab_box_screen.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String splashScreen = '/';
  static const String serviceListScreen = '/service_screen';
  static const String accountScreen = '/account_screen';
  static const String commentScreen = '/comment_screen';
  static const String savedScreen = '/saved_screen';
  static const String searchScreen = '/search_screen';
  static const String tabBoxScreen = '/tab_box_screen';
  static const String onboardingScreen = '/on_boarding_screen';
  static const String registerScreen = '/login_register_screen';

  static const String enterToAdminPanelScreen = '/gmail_verify_screen.dart';
  static const String adminPanelScreen = '/tab_box2.dart';
  static const String adminPanelScreen2 = '/admin_login_screen.dart';
  static const String addCatalogScreen = '/add_catalog_screen.dart';
  static const String addServiceScreen = '/add_service_screen.dart';
  static const String addCategoryScreen = '/add_category_screen.dart';
  static const String addServiceInfo = '/add_service_info.dart';
  static const String addNews = '/add_news.dart';
  static const String addPartners = '/add_partners.dart';
  static const String serviceInfoDetail = '/service_info_detail.dart';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteNames.serviceListScreen:
        return MaterialPageRoute(builder: (context) => const ServiceScreen());
      case RouteNames.accountScreen:
        return MaterialPageRoute(builder: (context) => const AccountScreen());
      case RouteNames.commentScreen:
        return MaterialPageRoute(builder: (context) => const CommentScreen());
      case RouteNames.savedScreen:
        return MaterialPageRoute(builder: (context) => const SavedScreen());
      case RouteNames.searchScreen:
        return MaterialPageRoute(builder: (context) => const SearchScreen());
      case RouteNames.tabBoxScreen:
        return MaterialPageRoute(builder: (context) => const TabBoxScreen());
      case RouteNames.onboardingScreen:
        return MaterialPageRoute(builder: (context) => const WelcomeScreen());
      case RouteNames.registerScreen:
        return MaterialPageRoute(
            builder: (context) => const UserRegisterScreen());
      case RouteNames.enterToAdminPanelScreen:
        return MaterialPageRoute(
            builder: (context) => const GmailVerifyScreen());
      case RouteNames.adminPanelScreen:
        return MaterialPageRoute(builder: (context) => const AdminTabBox());
      case RouteNames.adminPanelScreen2:
        return MaterialPageRoute(
            builder: (context) => const AdminLoginScreen());
      case RouteNames.addCatalogScreen:
        return MaterialPageRoute(
            builder: (context) => const AddCatalogScreen());
      case RouteNames.addServiceScreen:
        return MaterialPageRoute(
            builder: (context) => const AddServiceScreen());
      case RouteNames.addCategoryScreen:
        return MaterialPageRoute(
            builder: (context) => const AddCategoryScreen());
      case RouteNames.addServiceInfo:
        return MaterialPageRoute(
            builder: (context) => const AddServiceInfo());
      case RouteNames.addNews:
        return MaterialPageRoute(
            builder: (context) => const AddNews());
      case RouteNames.addPartners:
        return MaterialPageRoute(
            builder: (context) => const AddPartners());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text('Page Not Found'),
            ),
          );
        });
    }
  }
}
