import 'package:cleaning_house/bloc/catalog/catalog_bloc.dart';
import 'package:cleaning_house/cubits/account/account_cubit.dart';
import 'package:cleaning_house/cubits/admin/admin_cubit.dart';
import 'package:cleaning_house/cubits/auth/auth_cubit.dart';
import 'package:cleaning_house/cubits/catalog/add_catalog_cubit.dart';
import 'package:cleaning_house/cubits/catalog/catalog_index.dart';
import 'package:cleaning_house/cubits/category/category_cubit.dart';
import 'package:cleaning_house/cubits/comment/comment_cubit.dart';
import 'package:cleaning_house/cubits/news/news_cubit.dart';
import 'package:cleaning_house/cubits/service/add_service_cubit.dart';
import 'package:cleaning_house/cubits/service_info/service_info_cubit.dart';
import 'package:cleaning_house/cubits/tab/tab_box.dart';
import 'package:cleaning_house/cubits/user_data/user_data_cubit.dart';
import 'package:cleaning_house/data/repository/account_repository.dart';
import 'package:cleaning_house/data/repository/admin_repository.dart';
import 'package:cleaning_house/data/repository/auth_repository.dart';
import 'package:cleaning_house/data/repository/catalog_repository.dart';
import 'package:cleaning_house/data/repository/category_repository.dart';
import 'package:cleaning_house/data/repository/comment_repository.dart';
import 'package:cleaning_house/data/repository/general_data_repository.dart';
import 'package:cleaning_house/data/repository/news_repository.dart';
import 'package:cleaning_house/data/repository/serivce_info_repository.dart';
import 'package:cleaning_house/data/repository/service_repository.dart';
import 'package:cleaning_house/network_side/local/storage_repository.dart';
import 'package:cleaning_house/network_side/network/open_api_service.dart';
import 'package:cleaning_house/utils/app_routes.dart';
import 'package:cleaning_house/utils/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  await EasyLocalization.ensureInitialized();
  runApp(App(openApiService: OpenApiService()));
}

class App extends StatelessWidget {
  const App({super.key, required this.openApiService});

  final OpenApiService openApiService;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
              create: (context) =>
                  AuthRepository(openApiService: openApiService)),
          RepositoryProvider(
              create: (context) =>
                  GeneralDataRepository(apiService: openApiService)),
          RepositoryProvider(
              create: (context) =>
                  CatalogRepository(openApiService: openApiService)),
          RepositoryProvider(
              create: (context) =>
                  CommentRepository(openApiService: openApiService)),
          RepositoryProvider(
              create: (context) =>
                  NewsRepository(openApiService: openApiService)),
          RepositoryProvider(
              create: (context) =>
                  AccountRepository(openApiService: openApiService)),
          RepositoryProvider(
              create: (context) =>
                  CategoryRepository(openApiService: openApiService)),
          RepositoryProvider(
              create: (context) =>
                  ServiceInfoRepository(openApiService: openApiService)),
          RepositoryProvider(
              create: (context) =>
                  AdminRepository(openApiService: openApiService)),
          RepositoryProvider(
              create: (context) =>
                  ServiceRepository(openApiService: openApiService)),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                    AuthCubit(authRepository: context.read<AuthRepository>())),
            BlocProvider(create: (context) => TabCubit()),
            BlocProvider(create: (context) => CatalogIndexCubit()),
            BlocProvider(
                create: (context) => CatalogBloc(
                    catalogRepository: context.read<CatalogRepository>())),
            BlocProvider(
                create: (context) => CommentDataCubit(
                    commentRepository: context.read<CommentRepository>())),
            BlocProvider(create: (context) => UserDataCubit()),
            BlocProvider(
                create: (context) =>
                    NewsCubit(newsRepository: context.read<NewsRepository>())),
            BlocProvider(
                create: (context) => AccountCubit(
                    accountRepository: context.read<AccountRepository>())),
            BlocProvider(
                create: (context) => CategoryCubit(
                    categoryRepository: context.read<CategoryRepository>())),
            BlocProvider(
                create: (context) => ServiceInfoCubit(
                    serviceInfoRepository:
                        context.read<ServiceInfoRepository>())),
            BlocProvider(
                create: (context) => AdminCubit(
                    adminRepository: context.read<AdminRepository>())),
            BlocProvider(
                create: (context) => AddCatalogCubit(
                    catalogRepository: context.read<CatalogRepository>())),
            BlocProvider(
                create: (context) => AddServiceCubit(
                    serviceRepository: context.read<ServiceRepository>())),
          ],
          child: const MyApp(),
        ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          initialRoute: RouteNames.splashScreen,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
