import 'package:cleaning_house/network_side/models/universal_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

UniversalData getDioCustomError(DioException exception) {
  debugPrint("DIO ERROR TYPE: ${exception.type}");
  if (exception.response != null) {
    return UniversalData(error: exception.response!.data['message']);
  }
  switch (exception.type) {
    case DioException.sendTimeout:
      {
        return UniversalData(error: "sendTimeout");
      }
    case DioExceptionType.receiveTimeout:
      {
        return UniversalData(error: "reciveTimeout");
      }
    case DioExceptionType.cancel:
      {
        return UniversalData(error: "cancel");
      }
    case DioExceptionType.badCertificate:
      {
        return UniversalData(error: "badCertificate");
      }
    case DioExceptionType.badResponse:
      {
        return UniversalData(error: "badResponse");
      }
    case DioExceptionType.connectionError:
      {
        return UniversalData(error: "connectionError");
      }
    case DioExceptionType.connectionTimeout:
      {
        return UniversalData(error: "connectionTimeout");
      }
    default:
      {
        return UniversalData(error: "unknown");
      }
  }
}
