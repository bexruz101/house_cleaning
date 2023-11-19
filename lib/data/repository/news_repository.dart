import 'package:cleaning_house/network_side/models/universal_data.dart';
import 'package:cleaning_house/network_side/network/open_api_service.dart';

class NewsRepository {
  final OpenApiService openApiService;
  NewsRepository({required this.openApiService});

  Future<UniversalData> getNews() async => openApiService.getNews();
}
