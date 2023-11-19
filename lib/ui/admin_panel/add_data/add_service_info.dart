import 'package:cleaning_house/data/repository/admin_repository.dart';
import 'package:cleaning_house/network_side/network/open_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../auth/widgets/global_button.dart';

class AddServiceInfo extends StatefulWidget {
  const AddServiceInfo({Key? key}) : super(key: key);

  @override
  State<AddServiceInfo> createState() => _AddServiceInfoState();
}

class _AddServiceInfoState extends State<AddServiceInfo> {
  final dio = Dio();
  String description = '';
  String service_video = '';
  String service_image = '';
  String service_id = '';
  String category_id = '';
  String adminToken = "";
  String? selectedCatalog1;
  String? selectedCatalog2;
  Future<List<dynamic>>? k;
  Future<List<dynamic>>? t;
  Future<List<dynamic>>? p;

  Future<List<dynamic>> getServices() async {
    final response = await dio.get('http://165.227.195.35:3333/api/service');
    return response.data as List<dynamic>;
  }

  Future<List<dynamic>> getDio() async {
    final response =
        await dio.get('http://165.227.195.35:3333/api/serviceinfo');
    return response.data as List<dynamic>;
  }

  Future<List<dynamic>> getCategories() async {
    final response = await dio.get('http://165.227.195.35:3333/api/category');
    return response.data as List<dynamic>;
  }

  @override
  void initState() {
    k = getServices();
    t = getCategories();
    p = getDio();
    adminToken =
        AdminRepository(openApiService: OpenApiService()).getAdminToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add ServiceInfo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.start,
              onChanged: (v) {
                setState(() {
                  description = v;
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
              onChanged: (v) {
                setState(() {
                  service_image = v;
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
              onChanged: (v) {
                setState(() {
                  service_video = v;
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
                  'http://165.227.195.35:3333/api/serviceinfo',
                  options: Options(
                    headers: {
                      'Authorization': 'Bearer $adminToken',
                      'Content-Type': 'application/json'
                    },
                  ),
                  data: {
                    'description': description,
                    'service_video': service_video,
                    'service_image': service_image,
                    'service_id': service_id,
                    'category_id': category_id,
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
                    value: selectedCatalog1,
                    items: serviceList
                        .map<DropdownMenuItem<String>>(
                          (item) => DropdownMenuItem<String>(
                            value: item['id'].toString(),
                            child: Text(item['name'].toString()),
                          ),
                        )
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCatalog1 = newValue;
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
                  return DropdownButton<String>(
                    value: selectedCatalog2,
                    items: serviceList
                        .map<DropdownMenuItem<String>>(
                          (item) => DropdownMenuItem<String>(
                            value: item['id'].toString(),
                            child: Text(item['name'].toString()),
                          ),
                        )
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCatalog2 = newValue;
                        category_id = newValue ?? '';
                      });
                    },
                  );
                }
              },
            ),
            FutureBuilder<List<dynamic>>(
              future: p,
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
                        .map<Widget>(
                          (item) => Text(item['description']),
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
