
import 'package:cleaning_house/network_side/models/universal_data.dart';
import 'package:cleaning_house/network_side/network/open_api_service.dart';

class CategoryRepository {
  final OpenApiService openApiService;

  CategoryRepository({
    required this.openApiService,
  });

  Future<UniversalData> getCategory() async => openApiService.getCategory();
}
