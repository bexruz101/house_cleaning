import 'package:cleaning_house/ui/tab_box/account/widgets/biz_haqimizda.dart';
import 'package:cleaning_house/ui/tab_box/account/widgets/show_user_data.dart';
import 'package:cleaning_house/ui/tab_box/account/widgets/universal_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../network_side/local/storage_repository.dart';
import '../../../../utils/app_routes.dart';

class ListTiles extends StatelessWidget {
  const ListTiles(
      {super.key,
      required this.name,
      required this.phoneNumber,
      required this.orders});

  final String name;
  final String phoneNumber;
  final String orders;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          UniversalListTile(
              title: "Shaxsiy ma'lumotlar",
              leading: Icons.person_outline_outlined,
              onTap: () {
                showCustomerData(context,
                    userName: name, userPhone: phoneNumber, orders: orders);
              }),
          UniversalListTile(
              title: "Ilova tili",
              leading: Iconsax.language_circle,
              onTap: () {}),
          UniversalListTile(
              title: "Ilova rejimi", leading: Iconsax.sun_1, onTap: () {}),
          UniversalListTile(
              title: "Biz haqimizda",
              leading: Iconsax.menu_15,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BizHaqimizda()));
              }),
          UniversalListTile(
              title: "Chiqish",
              leading: Iconsax.menu_board,
              onTap: () {       
                Navigator.pushReplacementNamed(
                        context, RouteNames.onboardingScreen);
                    StorageRepository.deleteString('token');}),
        ],
      ),
    );
  }
}
