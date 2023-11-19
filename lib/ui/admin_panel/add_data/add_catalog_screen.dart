import 'package:cleaning_house/bloc/catalog/catalog_bloc.dart';
import 'package:cleaning_house/bloc/catalog/catalog_event.dart';
import 'package:cleaning_house/bloc/catalog/catalog_state.dart';
import 'package:cleaning_house/cubits/catalog/add_catalog_cubit.dart';
import 'package:cleaning_house/data/repository/admin_repository.dart';
import 'package:cleaning_house/network_side/local/storage_repository.dart';
import 'package:cleaning_house/network_side/models/status/form_status.dart';
import 'package:cleaning_house/network_side/network/open_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/colors.dart';
import '../../auth/widgets/global_button.dart';

class AddCatalogScreen extends StatefulWidget {
  const AddCatalogScreen({super.key});

  @override
  State<AddCatalogScreen> createState() => _AddCatalogScreenState();
}

class _AddCatalogScreenState extends State<AddCatalogScreen> {
  String text = "";
  String adminToken = "";

  @override
  void initState() {
    BlocProvider.of<CatalogBloc>(context).add(GetCatalogs());
    adminToken =
        AdminRepository(openApiService: OpenApiService()).getAdminToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = [];
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Catalog'),
        ),
        body: BlocBuilder<AddCatalogCubit, AddCatalogState>(
            builder: (context, state) {
          if (state.status == FormStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == FormStatus.success ||
              state.status == FormStatus.pure) {
            return Column(
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  textAlign: TextAlign.start,
                  onSubmitted: (v) {
                    text = v;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Text',
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
                GlobalButton(
                    title: 'Confirm',
                    onTap: () {
                      context.read<AddCatalogCubit>().addCatalog(
                          adminToken: adminToken.toString(), catalogName: text);
                      context.read<CatalogBloc>().add(GetCatalogs());
                    }),
                BlocBuilder<CatalogBloc, CatalogState>(
                    builder: (context, state) {
                  if (state is CatalogLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CatalogErrorState) {
                    return Center(
                      child: Text(state.errorText),
                    );
                  } else if (state is CatalogSuccessState) {
                    return Column(
                      children: List.generate(state.catalogs.length, (index) {
                        state.catalogs.map(
                          (e) {
                            items.add(e.id.toString());
                            StorageRepository.putList('catalogs_id',items);
                          },
                        );
                        return ListTile(
                          title: Text(state.catalogs[index].catalog_name),
                        );
                      }),
                    );
                  } else {
                    return const Text('NOTHING');
                  }
                }),
              ],
            );
          }

          return const Text('SOMTHING WENT WRONG');
        }));
  }
}
