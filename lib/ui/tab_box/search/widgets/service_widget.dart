import 'package:cleaning_house/network_side/models/category/category_model.dart';
import 'package:cleaning_house/ui/tab_box/search/widgets/service_info_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cubits/catalog/catalog_index.dart';
import '../../../../utils/images.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({super.key, required this.categories});

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    var currentIndex = context.watch<CatalogIndexCubit>().state;
    return SliverList(
      delegate: SliverChildListDelegate(
        List.generate(categories[currentIndex].service_info.length, (index) {
          var services = categories[currentIndex].service_info;
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ServiceInfoDetail(
                              desc: services[index].description,
                              image: services[index].service_image,
                              video: services[index].service_video,
                            )));
              },
              leading: Image.asset(AppImages.girl),
              title: Text(services[index].description),
            ),
          );
        }),
      ),
    );
  }
}
