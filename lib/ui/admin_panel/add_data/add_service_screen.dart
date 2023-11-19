

import 'package:cleaning_house/bloc/catalog/catalog_bloc.dart';
import 'package:cleaning_house/bloc/catalog/catalog_state.dart';
import 'package:cleaning_house/data/repository/admin_repository.dart';
import 'package:cleaning_house/network_side/network/open_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/colors.dart';
import '../../auth/widgets/global_button.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({Key? key}) : super(key: key);

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  final dio = Dio();
  String title = '';
  String desc = '';
  String catalog_id = '';
  String adminToken = "";
  String? selectedCatalog;
  Future<List<dynamic>>? k;
  Future<List<dynamic>>? t;

  Future<List<dynamic>> getDio() async {
    final response = await dio.get('http://165.227.195.35:3333/api/catalog');
    return response.data as List<dynamic>;
  }

  Future<List<dynamic>> getCat() async {
    final response = await dio.get('http://165.227.195.35:3333/api/service');
    print("RESPONSEEE:${response.data}");
    return response.data as List<dynamic>;
  }

  @override
  void initState() {
    super.initState();
    k = getDio();
    t = getCat();
    adminToken =
        AdminRepository(openApiService: OpenApiService()).getAdminToken();
  }
  @override
  Widget build(BuildContext context) {
    print('ADMINTOKEEEN:${adminToken}');
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
                title = v;
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
                desc = v;
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
                final Response response = await dio.post(
                  'http://165.227.195.35:3333/api/service',
                  options: Options(
                    headers: {
                      'Authorization': 'Bearer $adminToken',
                      'Content-Type': 'application/json'
                    },
                  ),
                  data: {
                    'title': '$title',
                    'description': '$desc',
                    'catalog_id': '$catalog_id',
                  },
                );
              },
            ),
            FutureBuilder<List<dynamic>>(
              future: k,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No data available');
                } else {
                  List<dynamic> serviceList = snapshot.data!;
                  return DropdownButton<String>(
                    value: selectedCatalog,
                    items: serviceList
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item['id'].toString(),
                            child: Text(item['catalog_name'].toString()),
                          ),
                        )
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        print("NEWVALUESSS:${newValue}");
                        selectedCatalog = newValue;
                        catalog_id = newValue ?? '';
                      });
                    },
                  );
                }
              },
            ),
            FutureBuilder<List<dynamic>>(
              future: t,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No data available');
                } else {
                  List<dynamic> serviceList = snapshot.data!;
                  return Column(
                    children: List.generate(serviceList.length, (index) {
                      return Text(serviceList[index]['title']);
                    }),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
