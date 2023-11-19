import 'package:cleaning_house/network_side/models/universal_data.dart';
import 'package:cleaning_house/network_side/network/open_api_service.dart';

class CatalogRepository {
  final OpenApiService openApiService;
  CatalogRepository({required this.openApiService});

  Future<UniversalData> getCatalogs() async => openApiService.getCatalog();

  Future<UniversalData> addCatalog(String catalogName,String adminToken) async => openApiService
      .postCatalog(catalogName: catalogName, adminToken: adminToken);
}
