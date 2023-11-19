import 'package:cleaning_house/cubits/comment/comment_cubit.dart';
import 'package:cleaning_house/network_side/local/storage_repository.dart';
import 'package:cleaning_house/ui/tab_box/comment/widgets/comment_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/repository/admin_repository.dart';
import '../../../network_side/network/open_api_service.dart';
import '../../../utils/colors.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final dio = Dio();
  String comment = '';
  int rating = 0;
  String token = '';

  @override
  void initState() {
    BlocProvider.of<CommentDataCubit>(context).getCommentData();
    token = StorageRepository.getString('token');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: ((BuildContext context) {
                  return AlertDialog(
                    content: Column(children: [
                      TextField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.start,
                        onChanged: (v) {
                          comment = v;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          hintText: 'Comment',
                          hintStyle: Theme.of(context).textTheme.titleMedium,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(width: 1, color: AppColors.C_0FC36D),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(width: 1, color: AppColors.C_0FC36D),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(width: 1, color: AppColors.C_0FC36D),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(width: 1, color: AppColors.C_0FC36D),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.start,
                        onChanged: (v) {
                          rating = int.parse(v);
                        },
                        decoration: InputDecoration(
                          filled: true,
                          hintText: 'Rating',
                          hintStyle: Theme.of(context).textTheme.titleMedium,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(width: 1, color: AppColors.C_0FC36D),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(width: 1, color: AppColors.C_0FC36D),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(width: 1, color: AppColors.C_0FC36D),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(width: 1, color: AppColors.C_0FC36D),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ZoomTapAnimation(
                        child: Text('Save'),
                        onTap: () async {
                          final Response response = await dio.post(
                            'http://165.227.195.35:3333/api/comment',
                            options: Options(
                              headers: {
                                'Authorization': 'Bearer $token',
                                'Content-Type': 'application/json'
                              },
                            ),
                            data: {'comment': comment, 'rating': rating},
                          );
                          Navigator.pop(context);
                        },
                      )
                    ]),
                  );
                }));
          },
        ),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Xabarlar',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: BlocBuilder<CommentDataCubit, CommentDataState>(
          builder: (context, state) {
            if (state is CommentDataLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CommentDataSuccessState) {
              return CommenView(commentModel: state.commentModel);
            } else if (state is CommentDataErrorState) {
              return Center(
                child: Text(state.errorText),
              );
            } else {
              return const Text('NOTHING');
            }
          },
        ));
  }
}
