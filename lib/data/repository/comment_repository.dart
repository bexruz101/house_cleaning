import 'package:cleaning_house/network_side/models/comments/post_comment.dart';
import 'package:cleaning_house/network_side/models/universal_data.dart';
import 'package:cleaning_house/network_side/network/open_api_service.dart';

class CommentRepository {
  final OpenApiService openApiService;
  CommentRepository({required this.openApiService});

  Future<UniversalData> getComments() async => openApiService.getComment();

  // Future<UniversalData> postComment(
  //         {required PostComment postComment,
  //         required String userToken}) async =>
  //     openApiService.postComment(
  //         postComment: postComment, userToken: userToken);
}
