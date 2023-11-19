import 'package:cleaning_house/ui/tab_box/account/widgets/universal_list_tile.dart';
import 'package:flutter/material.dart';

Future<void> showCustomerData(BuildContext context,
    {required String userName,
    required String userPhone,
    required String orders}) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Shxasiy malumotlar'),
          actions: [
            UniversalListTile(
              title: userName,
              leading: Icons.person_2,
              onTap: null,
            ),
            UniversalListTile(
                title: userPhone, leading: Icons.phone, onTap: null),
            UniversalListTile(
                title: 'buyurtmalar soni:${orders.length}ta',
                leading: Icons.shopping_bag_outlined,
                onTap: null),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      });
}
