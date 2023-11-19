import 'package:cleaning_house/data/repository/admin_repository.dart';
import 'package:cleaning_house/network_side/network/open_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../auth/widgets/global_button.dart';

class AddNews extends StatefulWidget {
  const AddNews({Key? key}) : super(key: key);

  @override
  State<AddNews> createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  final dio = Dio();
  String news_title = '';
  String news_description = '';
  String news_image = '';
  String news_video = '';
  String adminToken = "";

  @override
  void initState() {
    adminToken = AdminRepository(openApiService: OpenApiService()).getAdminToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add News'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.start,
              onSubmitted: (v) {
                setState(() {
                  news_title = v;
                });
              },
              decoration: InputDecoration(
                filled: true,
                hintText: 'Title',
                hintStyle: Theme.of(context).textTheme.titleMedium,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1, color: AppColors.C_0FC36D),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1, color: AppColors.C_0FC36D),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1, color: AppColors.C_0FC36D),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1, color: AppColors.C_0FC36D),
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.start,
              onSubmitted: (v) {
                setState(() {
                  news_description = v;
                });
              },
              decoration: InputDecoration(
                filled: true,
                hintText: 'Description',
                hintStyle: Theme.of(context).textTheme.titleMedium,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1, color: AppColors.C_0FC36D),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1, color: AppColors.C_0FC36D),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1, color: AppColors.C_0FC36D),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1, color: AppColors.C_0FC36D),
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.start,
              onSubmitted: (v) {
                setState(() {
                  news_image = v;
                });
              },
              decoration: InputDecoration(
                filled: true,
                hintText: 'Image',
                hintStyle: Theme.of(context).textTheme.titleMedium,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1, color: AppColors.C_0FC36D),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1, color: AppColors.C_0FC36D),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1, color: AppColors.C_0FC36D),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1, color: AppColors.C_0FC36D),
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.start,
              onSubmitted: (v) {
                setState(() {
                  news_video = v;
                });
              },
              decoration: InputDecoration(
                filled: true,
                hintText: 'Video',
                hintStyle: Theme.of(context).textTheme.titleMedium,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1, color: AppColors.C_0FC36D),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1, color: AppColors.C_0FC36D),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1, color: AppColors.C_0FC36D),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1, color: AppColors.C_0FC36D),
                ),
              ),
            ),
            GlobalButton(
              title: 'Confirm',
              onTap: () async {
                final Response response = await dio.post(
                  'http://165.227.195.35:3333/api/news',
                  options: Options(
                    headers: {
                      'Authorization': 'Bearer $adminToken',
                      'Content-Type': 'application/json'
                    },
                  ),
                  data: {
                    'news_title': news_title,
                    'news_description': news_description,
                    'news_image': news_image,
                    'news_video': news_video,
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
