import 'package:cleaning_house/network_side/network/open_api_service.dart';

import '../../network_side/local/storage_repository.dart';
import '../../network_side/models/universal_data.dart';

class AdminRepository {
  final OpenApiService openApiService;
  AdminRepository({
    required this.openApiService,
  });

  Future<UniversalData> verifyCode({required int code}) async =>
      openApiService.verifyCode(code: code);

  Future<UniversalData> loginAdminAndSendCodeToGmail(
          {required String gmail, required String password}) async =>
      openApiService.loginAdminAndSendCodeToGmail(
          gmail: gmail, password: password);

  String getAdminToken() => StorageRepository.getString('Admintoken');

  Future<void> setAdminToken(String newToken) async =>
      StorageRepository.putString('Admintoken', newToken);

  Future<bool?> deleteToken() async =>
      StorageRepository.deleteBool('Admintoken');
}
