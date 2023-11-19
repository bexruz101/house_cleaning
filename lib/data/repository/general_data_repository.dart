import 'package:cleaning_house/network_side/network/open_api_service.dart';
import '../../network_side/models/universal_data.dart';

class GeneralDataRepository{
  final OpenApiService apiService;

  GeneralDataRepository({required this.apiService});

  Future<UniversalData> getCatalogData() async => apiService.getCatalog();

}