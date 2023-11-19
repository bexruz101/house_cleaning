import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final dio = Dio();
  int currentIndex = 0;
  Future<List<dynamic>>? k;

  Future<List<dynamic>> getDio() async {
    final response = await dio.get('http://165.227.195.35:3333/api/partners');
    return response.data as List<dynamic>;
  }

  @override
  void initState() {
    k = getDio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Partners',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
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
                    return Column(
                      children: List.generate(serviceList.length, (index) {
                        return ListTile(
                          title: Text(serviceList[index]['partner_title']),
                          leading: Text(serviceList[index]['partner_logo']),
                        );
                      }),
                    );
                  }
                })
          ]),
        ));
  }
}
