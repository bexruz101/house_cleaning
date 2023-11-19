import 'package:cleaning_house/network_side/local/storage_repository.dart';
import 'package:cleaning_house/network_side/models/admin/admin_model.dart';
import 'package:cleaning_house/network_side/models/admin/admin_token_model.dart';
import 'package:cleaning_house/network_side/models/catalog/catalog_model.dart';
import 'package:cleaning_house/network_side/models/category/category_model.dart';
import 'package:cleaning_house/network_side/models/category/post_category_model.dart';
import 'package:cleaning_house/network_side/models/comments/comments_model.dart';
import 'package:cleaning_house/network_side/models/customer/customer_post_model.dart';
import 'package:cleaning_house/network_side/models/news/news_model.dart';
import 'package:cleaning_house/network_side/models/news/post_news_model.dart';
import 'package:cleaning_house/network_side/models/partners/post_partners_model.dart';
import 'package:cleaning_house/network_side/models/service/post_service_model.dart';
import 'package:cleaning_house/network_side/models/service/service_model.dart';
import 'package:cleaning_house/network_side/models/service_info/post_service_info.dart';
import 'package:cleaning_house/network_side/models/service_info/service_info_model.dart';
import 'package:cleaning_house/utils/constants.dart';
import 'package:cleaning_house/utils/custom_erros.dart';
import 'package:dio/dio.dart';
import '../models/customer/customer_info.dart';
import '../models/universal_data.dart';

class OpenApiService {
  final _dioOpen = Dio(BaseOptions(
    baseUrl: baseUrl,
    headers: {"Content-Type": "application/json"},
    connectTimeout: Duration(seconds: TimeOutConstants.connectTimeout),
    receiveTimeout: Duration(seconds: TimeOutConstants.receiveTimeout),
    sendTimeout: Duration(seconds: TimeOutConstants.sendTimeout),
  ));

  OpenApiService() {
    _init();
  }

  _init() {
    _dioOpen.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          print('ERRORGA KIRDI:${error.message} and ${error.response}}');
          return handler.next(error);
        },
        onRequest: (requestOptions, handler) async {
          print("SO'ROV YUBORILDI:${requestOptions.path}");
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          print("JAVOB KELDI: ${response.requestOptions.path}");
          return handler.next(response);
        },
      ),
    );
  }

  // -----------ENTERING TO ADMIN PANEL---------------

  Future<UniversalData> loginAdminAndSendCodeToGmail(
      {required String gmail, required String password}) async {
    Response response;
    try {
      response = await _dioOpen.post('/auth/login',
          data: AdminModel(password: password, email: gmail)
              .toJson(gmail, password));
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return UniversalData(data: response.data['message'] as String);
      }
      return UniversalData(error: 'Other Error');
    } on DioException catch (e) {
      return getDioCustomError(e);
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }

  Future<UniversalData> verifyCode({required int code}) async {
    Response response;
    try {
      response =
          await _dioOpen.post('/auth/verify', data: {"verifyCode": code});
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        StorageRepository.putString('Admintoken',response.data['token']);
        return UniversalData(data: AdminTokenModel.fromJson(response.data));
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      return getDioCustomError(e);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  // -----------AUTHENTICATION-----------

  Future<UniversalData> registerUser(
      {required CustomerPostModel customerPostModel}) async {
    Response response;
    try {
      response = await _dioOpen.post(
        '/auth/register',
        data: customerPostModel.toJson(customerPostModel),
      );
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return UniversalData(data: response.data["token"].toString());
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      return getDioCustomError(e);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  // ----------- GET DATA-----------

  Future<UniversalData> getCatalog() async {
    Response response;
    try {
      response = await _dioOpen.get('/catalog');
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        List<dynamic> responseData = response.data as List<dynamic>;
        List<CatalogModel> catalogList = responseData.map((e) {
          return CatalogModel.fromJson(e);
        }).toList();
        return UniversalData(data: catalogList);
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      return getDioCustomError(e);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> getComment() async {
    Response response;
    try {
      response = await _dioOpen.get('/comment');
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        List<dynamic> responseData = response.data as List<dynamic>;
        List<CommentsModel> commentsList = responseData.map((e) {
          return CommentsModel.fromJson(e);
        }).toList();
        return UniversalData(data: commentsList);
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      return getDioCustomError(e);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> getNews() async {
    Response response;
    try {
      response = await _dioOpen.get('/news');
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        List<dynamic> responseData = response.data as List<dynamic>;
        List<NewsModel> newsList = responseData.map((e) {
          return NewsModel.fromJson(e);
        }).toList();

        return UniversalData(data: newsList);
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      return getDioCustomError(e);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> getCustomerInfo({required String userToken}) async {
    Response response;
    try {
      response = await _dioOpen.post('/customer/myinfo',
          options: Options(headers: {
            'Authorization': 'Bearer $userToken',
          }));
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return UniversalData(data: CustomerInfo.fromJson(response.data));
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      return getDioCustomError(e);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> updateCustomerInfo(
      {required String userToken,
      required CustomerPostModel customerPostModel}) async {
    Response response;
    try {
      response = await _dioOpen.patch('/customer',
          options: Options(headers: {
            'Authorization': 'Bearer $userToken',
          }),
          data: customerPostModel.toJson(customerPostModel));
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return UniversalData(data: CustomerInfo.fromJson(response.data));
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      return getDioCustomError(e);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> getCategory() async {
    Response response;
    try {
      response = await _dioOpen.get('/category');
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        List<dynamic> responseData = response.data as List<dynamic>;
        List<CategoryModel> categoryList = responseData.map((e) {
          return CategoryModel.fromJson(e);
        }).toList();
        return UniversalData(data: categoryList);
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      return getDioCustomError(e);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> getServiceInfo() async {
    Response response;
    try {
      response = await _dioOpen.get('/serviceinfo');
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        List<dynamic> responseData = response.data as List<dynamic>;
        List<ServiceInfoModel> serviceInfo = responseData.map((e) {
          return ServiceInfoModel.fromJson(e);
        }).toList();
        return UniversalData(data: serviceInfo as ServiceModel);
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      return getDioCustomError(e);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  // Future<UniversalData> postComment(
  //     {required PostComment postComment, required String userToken}) async {
  //   Response response;
  //   try {
  //     response = await _dioOpen.post('/comment',
  //         data: postComment.toJson(postComment),
  //         options: Options(headers: {
  //           'Authorization': 'Bearer $userToken',
  //         }));
  //     if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
  //       List<dynamic> responseData = response.data as List<dynamic>;
  //       List<ServiceInfoModel> serviceInfo = responseData.map((e) {
  //         return ServiceInfoModel.fromJson(e);
  //       }).toList();
  //       return UniversalData(data: serviceInfo as ServiceModel);
  //     }
  //     return UniversalData(error: "Other Error");
  //   } on DioException catch (e) {
  //     return getDioCustomError(e);
  //   } catch (error) {
  //     return UniversalData(error: error.toString());
  //   }
  // }

  // Future<UniversalData> getPartners({required String adminToken}) async {
  //   Response response;
  //   try {
  //     response = await _dioOpen.get('/partners',
  //         options: Options(headers: {'Authorization': 'Bearer $adminToken'}));
  //     if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
  //       List<dynamic> responseData = response.data as List<dynamic>;
  //       List<PartenrsModel> partenrsList = responseData.map((e) {
  //         return PartenrsModel.fromJson(e);
  //       }).toList();
  //       return UniversalData(data: partenrsList);
  //     }
  //     return UniversalData(error: "Other Error");
  //   } on DioException catch (e) {
  //     return getDioCustomError(e);
  //   } catch (error) {
  //     return UniversalData(error: error.toString());
  //   }
  // }

  //-----------POST DATA--------------

  Future<UniversalData> postCatalog(
      {required String catalogName, required adminToken}) async {
    Response response;
    try {
      response = await _dioOpen.post('/catalog',
          data: {"catalog_name": catalogName},
          options: Options(headers: {
            'Authorization': 'Bearer $adminToken',
          }));
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return UniversalData(data: response.data['message']);
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      return getDioCustomError(e);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> postService(
      {required PostServiceModel postServiceModel, required adminToken}) async {
    Response response;
    try {
      response = await _dioOpen.post('/service',
          data: postServiceModel.toJson(),
          options: Options(headers: {
            'Authorization': 'Bearer $adminToken',
          }));
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return UniversalData(data: response.data['message']);
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      return getDioCustomError(e);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> postCategory(
      {required PostCategoryModel postCategoryModel,
      required adminToken}) async {
    Response response;
    try {
      response = await _dioOpen.post('/category',
          data: postCategoryModel.toJson(),
          options: Options(headers: {
            'Authorization': 'Bearer $adminToken',
          }));
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return UniversalData(data: response.data['message']);
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      return getDioCustomError(e);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> postServiceInfo(
      {required PostServiceInfoModel postServiceInfoModel,
      required adminToken}) async {
    Response response;
    try {
      response = await _dioOpen.post('/serviceinfo',
          data: postServiceInfoModel.toJson(),
          options: Options(headers: {
            'Authorization': 'Bearer $adminToken',
          }));
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return UniversalData(data: response.data['message']);
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      return getDioCustomError(e);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> postPartners(
      {required PostPartnersModel postPartnersModel,
      required adminToken}) async {
    Response response;
    try {
      response = await _dioOpen.post('/partners',
          data: postPartnersModel.toJson(),
          options: Options(headers: {
            'Authorization': 'Bearer $adminToken',
          }));
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return UniversalData(data: response.data['message']);
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      return getDioCustomError(e);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> postNews(
      {required PostNewsModel postNewsModel, required adminToken}) async {
    Response response;
    try {
      response = await _dioOpen.post('/news',
          data: postNewsModel.toJson(),
          options: Options(headers: {
            'Authorization': 'Bearer $adminToken',
          }));
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return UniversalData(data: response.data['message']);
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      return getDioCustomError(e);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }
}
