import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../../cubits/account/account_cubit.dart';
import '../../../../data/repository/auth_repository.dart';
import '../../../../network_side/models/customer/customer_post_model.dart';
import '../../../../network_side/network/open_api_service.dart';

class DisplayCustomerData extends StatefulWidget {
  const DisplayCustomerData({super.key, required this.name});

  final String name;

  @override
  State<DisplayCustomerData> createState() => _DisplayCustomerDataState();
}
class _DisplayCustomerDataState extends State<DisplayCustomerData> {
  

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(widget.name),
      trailing: IconButton(
        onPressed: () {
          showEditDialog(context);
        },
        icon: Icon(Iconsax.edit_2),
      ),
    );
  }

  void showEditDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(hintText: 'New Name'),
              ),
              TextField(
                inputFormatters: [
                  MaskTextInputFormatter(
                      mask: '+998 (##) ###-##-##',
                      filter: {"#": RegExp('[0-9]')},
                      type: MaskAutoCompletionType.lazy),
                ],
                controller: phoneController,
                decoration: InputDecoration(hintText: '+998 (XX) XXX-XX-XX'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Call the update function here
                String newName = nameController.text;
                String newPhoneNumber = phoneController.text;
                String token =
                    AuthRepository(openApiService: OpenApiService()).getToken();
                CustomerPostModel newCustomerInfo = CustomerPostModel(
                  name: newName,
                  phone_number: newPhoneNumber,
                );
                BlocProvider.of<AccountCubit>(context).updateUserData(
                    userToken: token, customerPostModel: newCustomerInfo);
                setState(() {});
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
