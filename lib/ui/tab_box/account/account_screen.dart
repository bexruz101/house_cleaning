import 'package:cleaning_house/data/repository/auth_repository.dart';
import 'package:cleaning_house/network_side/network/open_api_service.dart';
import 'package:cleaning_house/ui/tab_box/account/widgets/display_customer_info.dart';
import 'package:cleaning_house/ui/tab_box/account/widgets/list_tiles_widget.dart';
import 'package:cleaning_house/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/account/account_cubit.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    String token = AuthRepository(openApiService: OpenApiService()).getToken();
    BlocProvider.of<AccountCubit>(context).getUserData(userToken: token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Profile',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        body:
            BlocBuilder<AccountCubit, AccountState>(builder: (context, state) {
          if (state is AccountLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AccountSuccessState) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  DisplayCustomerData(name: state.customerInfo.name),
                  const Divider(),
                  const SizedBox(height: 10),
                  ListTiles(
                      name: state.customerInfo.name,
                      phoneNumber: state.customerInfo.phone_number,
                      orders:
                          'Buyurtmalaringiz soni:${state.customerInfo.orders.length}ta '),
                ],
              ),
            );
          } else if (state is AccountErrorState) {
            return Center(
              child: Text(state.errorText),
            );
          } else {
            return const Text('NOTHING');
          }
        }));
  }
}
