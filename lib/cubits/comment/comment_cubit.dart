import 'package:cleaning_house/data/repository/comment_repository.dart';
import 'package:cleaning_house/network_side/models/universal_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../network_side/models/comments/comments_model.dart';
part 'comment_state.dart';

class CommentDataCubit extends Cubit<CommentDataState> {
  CommentDataCubit({required this.commentRepository})
      : super(CommentDataInitial());

  CommentRepository commentRepository;

  getCommentData() async {
    emit(CommentDataLoadingState());
    UniversalData response = await commentRepository.getComments();
    if (response.error.isEmpty) {
      emit(CommentDataSuccessState(
          commentModel: response.data as List<CommentsModel>));
    } else {
      emit(CommentDataErrorState(errorText: response.error));
    }
  }

  // postComment({required PostComment postComment,required String userToken})async{
  //   emit(CommentDataLoadingState());
  //    UniversalData response = await commentRepository.postComment(postComment:postComment , userToken: userToken);
  //        if (response.error.isEmpty) {
  //     emit(CommentDataPostedSuccessState());
  //   } else {
  //     emit(CommentDataPostedErrorState(errorText: response.error));
  //   }
  // }
}
