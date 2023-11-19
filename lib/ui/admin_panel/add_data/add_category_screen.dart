import 'package:cleaning_house/bloc/catalog/catalog_bloc.dart';
import 'package:cleaning_house/bloc/catalog/catalog_state.dart';
import 'package:cleaning_house/data/repository/admin_repository.dart';
import 'package:cleaning_house/network_side/network/open_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/colors.dart';
import '../../auth/widgets/global_button.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
 final dio = Dio();
  String category_name = '';
  String service_id = '';
  String adminToken = "";
  String? selectedCatalog;
  Future<List<dynamic>>? k;
  Future<List<dynamic>>? t;

  Future<List<dynamic>> getDio() async {
    final response = await dio.get('http://165.227.195.35:3333/api/service');
    return response.data as List<dynamic>;
  }

  Future<List<dynamic>> getCat() async {
    final response =
        await dio.get('http://165.227.195.35:3333/api/category');
    return response.data as List<dynamic>;
  }

  @override
  void initState() {
    super.initState();
    k = getDio();
    t = getCat();
    adminToken = AdminRepository(openApiService: OpenApiService())
        .getAdminToken();
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
                category_name = v;
              },
              decoration: InputDecoration(
                filled: true,
                hintText: 'title',
                hintStyle: Theme.of(context).textTheme.titleMedium,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(width: 1, color: AppColors.C_0FC36D),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(width: 1, color: AppColors.C_0FC36D),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(width: 1, color: AppColors.C_0FC36D),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(width: 1, color: AppColors.C_0FC36D),
                ),
              ),
            ),
            GlobalButton(
              title: 'Confirm',
              onTap: () async {
                final Response response = await dio.post(
                  'http://165.227.195.35:3333/api/category',
                  options: Options(
                    headers: {
                      'Authorization': 'Bearer $adminToken',
                      'Content-Type': 'application/json'
                    },
                  ),
                  data: {
                    'category_name': '$category_name',
                    'service_id': '$service_id',
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
                            child: Text(item['id'].toString()),
                          ),
                        )
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCatalog = newValue;
                        service_id = newValue ?? '';
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
                    children: serviceList
                        .map(
                          (item) => Text(item['category_name']),
                        )
                        .toList(),
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
