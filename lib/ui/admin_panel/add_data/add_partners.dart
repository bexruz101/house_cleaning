import 'package:cleaning_house/data/repository/admin_repository.dart';
import 'package:cleaning_house/network_side/network/open_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../auth/widgets/global_button.dart';

class AddPartners extends StatefulWidget {
  const AddPartners({super.key});

  @override
  State<AddPartners> createState() => _AddPartnersState();
}

class _AddPartnersState extends State<AddPartners> {
  final dio = Dio();
  String partner_logo = '';
  String partner_title = '';
  String partner_description = '';
  String adminToken = "";

  @override
  void initState() {
    adminToken =
        AdminRepository(openApiService: OpenApiService()).getAdminToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Service'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                textAlign: TextAlign.start,
                onSubmitted: (v) {
                  partner_logo = v;
                },
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'logo',
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
                  partner_title = v;
                },
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'title',
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
                  partner_description = v;
                },
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'description',
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
                    final Response response = await dio
                        .post('http://165.227.195.35:3333/api/partners',
                            options: Options(
                              headers: {
                                'Authorization': 'Bearer $adminToken',
                                "Content-Type": "application/json"
                              },
                            ),
                            data: {
                          "partner_logo": "${partner_logo}",
                          "partner_title": "${partner_title}",
                          "partner_description": "${partner_description}",
                        });
                  }),
            ],
          ),
        ));
  }
}
