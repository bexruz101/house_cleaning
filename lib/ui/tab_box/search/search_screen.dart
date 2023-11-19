import 'package:cleaning_house/bloc/catalog/catalog_event.dart';
import 'package:cleaning_house/cubits/category/category_cubit.dart';
import 'package:cleaning_house/cubits/news/news_cubit.dart';
import 'package:cleaning_house/ui/tab_box/search/widgets/catalog_widget.dart';
import 'package:cleaning_house/ui/tab_box/search/widgets/main_text.dart';
import 'package:cleaning_house/ui/tab_box/search/widgets/news_widget.dart';
import 'package:cleaning_house/ui/tab_box/search/widgets/search_widget.dart';
import 'package:cleaning_house/ui/tab_box/search/widgets/service_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/catalog/catalog_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    BlocProvider.of<NewsCubit>(context).getNews();
    BlocProvider.of<CatalogBloc>(context).add(GetCatalogs());
    BlocProvider.of<CategoryCubit>(context).getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Search Screen',
            style: TextStyle(color: Colors.black12),
          ),
        ),
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CategoryErrorState) {
              return Center(
                child: Text(state.errorText),
              );
            } else if (state is CategorySuccessState) {
              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  const MainText(text: 'Katalog'),
                  CategoryWidget(
                      itemCount: state.categories.length,
                      categoryModel: state.categories),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 10),
                  ),
                  const NewsWidget(),
                  const MainText(text: 'Xizmatlar'),
                  ServiceWidget(categories: state.categories),
                ],
              );
            } else {
              return const Text('NOTHING');
            }
          },
        ));
  }
}
