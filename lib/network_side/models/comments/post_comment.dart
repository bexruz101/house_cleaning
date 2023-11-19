class PostComment {
  final String comment;
  final int rating;
  PostComment({
    required this.comment,
    required this.rating,
  });
  

  PostComment copyWith({
    String? comment,
    int? rating,
  }) {
    return PostComment(
      comment: comment ?? this.comment,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toJson(PostComment postComment) {
    return <String, dynamic>{
      'comment': postComment.comment,
      'rating': postComment.rating,
    };
  }

  factory PostComment.fromJson(Map<String, dynamic> map) {
    return PostComment(
      comment: map['comment'] as String,
      rating: map['rating'] as int,
    );
  }


  @override
  String toString() => 'PostComment(comment: $comment, rating: $rating)';

  @override
  bool operator ==(covariant PostComment other) {
    if (identical(this, other)) return true;
  
    return 
      other.comment == comment &&
      other.rating == rating;
  }

  @override
  int get hashCode => comment.hashCode ^ rating.hashCode;
}
