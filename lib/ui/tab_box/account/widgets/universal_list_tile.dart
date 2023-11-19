import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';

class UniversalListTile extends StatelessWidget {
  const UniversalListTile({super.key, required this.title, required this. leading, required this.onTap});

  final String title;
  final IconData leading;
  final VoidCallback? onTap;
  


  @override
  Widget build(BuildContext context) {
    return Card(
       clipBehavior: Clip.antiAlias,
      child: ListTile(
        leading: Container(
          height: 38,
          width: 38,
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(shape:BoxShape.circle,color: AppColors.C_E9FEF4,),
          child: Icon(leading ,color: AppColors.C_0FC36D,),
        ),
        title: Text(title),
        trailing: onTap == null ?null:Icon(Icons.arrow_forward_ios_outlined),
        onTap: onTap,
      ),
    );
  }
}
