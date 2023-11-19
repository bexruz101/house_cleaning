import 'package:cleaning_house/network_side/models/service/post_service_model.dart';
import '../../network_side/models/universal_data.dart';
import '../../network_side/network/open_api_service.dart';

class ServiceRepository {
  final OpenApiService openApiService;
  ServiceRepository({required this.openApiService});

  //Future<UniversalData> getServices() async => openApiService.getServices();

  Future<UniversalData> addCService(PostServiceModel postServiceModel,String adminToken) async => openApiService
      .postService(postServiceModel: postServiceModel, adminToken: adminToken);
}