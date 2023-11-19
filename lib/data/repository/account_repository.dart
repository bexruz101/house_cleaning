import 'package:cleaning_house/network_side/models/customer/customer_post_model.dart';
import 'package:cleaning_house/network_side/models/universal_data.dart';
import 'package:cleaning_house/network_side/network/open_api_service.dart';

class AccountRepository {
  final OpenApiService openApiService;

  AccountRepository({
    required this.openApiService,
  });

  Future<UniversalData> getCustomerDataById(
          {required String userToken}) async =>
      openApiService.getCustomerInfo(userToken: userToken);

  Future<UniversalData> updateUserData(
          {required String userToken,
          required CustomerPostModel customerPostModel}) async =>
      openApiService.updateCustomerInfo(
          userToken: userToken, customerPostModel: customerPostModel);
}
