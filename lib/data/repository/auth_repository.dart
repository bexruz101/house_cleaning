import 'package:cleaning_house/network_side/local/storage_repository.dart';
import 'package:cleaning_house/network_side/models/customer/customer_post_model.dart';
import 'package:cleaning_house/network_side/network/open_api_service.dart';
import '../../network_side/models/universal_data.dart';

class AuthRepository {
  final OpenApiService openApiService;

  AuthRepository({required this.openApiService});


  Future<UniversalData> registerUser(
          {required  CustomerPostModel customerPostModel}) async =>
      openApiService.registerUser(customerPostModel: customerPostModel);

  String getToken()=> StorageRepository.getString('token');

  Future<void> setToken(String newToken)async=>StorageRepository.putString('token', newToken);

    Future<bool?> deleteToken() async =>
      StorageRepository.deleteBool('token');


}
