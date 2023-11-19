import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/colors.dart';


class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text('Saqlangan Xizmatlar',style: Theme.of(context).textTheme.titleLarge,),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: List.generate(20, (index) =>  Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            decoration: BoxDecoration(border: Border.all(color: AppColors.C_ECEFD4,),borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              trailing:Text("\$20/Xona",style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.C_0FC36D),),
              title:Text('Tozalash'),
              subtitle: Text('Uy,ofis',),
              leading: Container(
                height: 38,
                width: 38,
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(shape:BoxShape.circle,color: AppColors.C_E9FEF4,),
                child: Icon(Iconsax.building,color: AppColors.C_0FC36D,),
              ),
            ),
          ) ),
        ),
      ),
    );
  }
}
