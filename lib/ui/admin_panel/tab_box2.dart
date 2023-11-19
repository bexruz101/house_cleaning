import 'package:cleaning_house/network_side/local/storage_repository.dart';
import 'package:cleaning_house/ui/tab_box/account/widgets/universal_list_tile.dart';
import 'package:cleaning_house/utils/app_routes.dart';
import 'package:cleaning_house/utils/colors.dart';
import 'package:flutter/material.dart';

class AdminTabBox extends StatefulWidget {
  const AdminTabBox({super.key});

  @override
  State<AdminTabBox> createState() => _AdminTabBoxState();
}

class _AdminTabBoxState extends State<AdminTabBox> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Main Screen',
            style: TextStyle(color: AppColors.black),
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              UniversalListTile(
                  title: 'Add Catalog',
                  leading: Icons.list,
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.addCatalogScreen);
                  }),
              UniversalListTile(
                  title: 'Add Service',
                  leading: Icons.list,
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.addServiceScreen);
                  }),
              UniversalListTile(
                  title: 'Add Category',
                  leading: Icons.list,
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.addCategoryScreen);
                  }),
              UniversalListTile(
                  title: 'Add ServiceInfo',
                  leading: Icons.list,
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.addServiceInfo);
                  }),
              UniversalListTile(
                  title: 'Add News',
                  leading: Icons.list,
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.addNews);
                  }),
              UniversalListTile(
                  title: 'Add Partners',
                  leading: Icons.list,
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.addPartners);
                  }),
                  Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, RouteNames.onboardingScreen);
                    StorageRepository.deleteString('Admintoken');
                  },
                  child: const Text('LogOut')),
            ],
          ),
        ),
        body: Container());
  }
}
