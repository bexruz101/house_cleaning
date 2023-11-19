import 'package:cleaning_house/network_side/models/universal_data.dart';
import 'package:cleaning_house/network_side/network/open_api_service.dart';

class ServiceInfoRepository {
  final OpenApiService openApiService;
  ServiceInfoRepository({required this.openApiService});

  Future<UniversalData> getServiceInfo() async =>
      openApiService.getServiceInfo();
}
