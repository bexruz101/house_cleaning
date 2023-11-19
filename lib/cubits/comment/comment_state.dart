part of 'comment_cubit.dart';

@immutable
abstract class CommentDataState extends Equatable{}


class CommentDataInitial extends CommentDataState {
  @override
  List<Object?> get props => [];
}

class CommentDataLoadingState extends CommentDataState {
  @override
  List<Object?> get props => [];
}

class CommentDataSuccessState extends CommentDataState {
  final List<CommentsModel> commentModel;

  CommentDataSuccessState({required this.commentModel});

  @override
  List<Object?> get props => [commentModel];
}

class CommentDataPostedSuccessState extends CommentDataState {
  CommentDataPostedSuccessState();

  @override
  List<Object?> get props => [];
}

class CommentDataErrorState extends CommentDataState {
  final String errorText;

  CommentDataErrorState({required this.errorText});

  @override
  List<Object?> get props => [errorText];
}

class CommentDataPostedErrorState extends CommentDataState {
  final String errorText;

  CommentDataPostedErrorState({required this.errorText});

  @override
  List<Object?> get props => [errorText];
}