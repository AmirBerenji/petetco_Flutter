import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petetco/commons/dto/editprofile_dto.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/commons/widget/custom_btn.dart';
import 'package:petetco/commons/widget/custome_dialog.dart';
import 'package:petetco/commons/widget/custome_textfield.dart';
import 'package:petetco/features/auth/controllers/userinfo_provider.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen>
    with TickerProviderStateMixin {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeFields();
  }

  Future<void> _initializeFields() async {
    // Access the current UserInfo state
    final userInfo = await ref.read(userInfoStateProvider.notifier).userInfo();
    _name.text = userInfo.data!.name.toString() ?? "N/A";
    _address.text = userInfo.data!.address.toString() ?? "N/A";
    _phone.text = userInfo.data!.phone.toString() ?? "N/A";
  }

  @override
  Widget build(BuildContext context) {
    AppLayout.getSize(context);

    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        backgroundColor: Styles.bgColor,
        title: Text(
          'Edit your profile',
          style: Styles.headLineStyle3,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppLayout.getHeight(20)),
          child: Column(
            children: [
              CustomTextField(
                hintText: "Display Name",
                hintStyle: TextStyle(color: Styles.grey600),
                controller: _name,
              ),
              Gap(AppLayout.getHeight(15)),
              CustomTextField(
                hintText: "Phone Number",
                hintStyle: TextStyle(color: Styles.grey600),
                controller: _phone,
              ),
              Gap(AppLayout.getHeight(15)),
              CustomTextField(
                hintText: "Address",
                hintStyle: TextStyle(color: Styles.grey600),
                controller: _address,
              ),
              Gap(AppLayout.getHeight(15)),
              CustomButton(
                onTap: () {
                  if (_name.text.trim().isEmpty) {
                    CustomAwesomeDialog(context, "Please fill display name",
                            DialogType.error)
                        .show();
                    return;
                  }

                  var location = AddressLocation(lat: 10.05, lng: 10.05);

                  // Create EditProfileDto from the text field values
                  var model = EditProfileDto(
                    name: _name.text,
                    address: _address.text,
                    phone: _phone.text,
                    addressLocation: location,
                  );

                  // Call the editProfile method from the provider
                  ref
                      .read(userInfoStateProvider.notifier)
                      .editProfile(model)
                      .then((_) {
                    Navigator.pop(context);
                  }).catchError((e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to update profile.')),
                    );
                  });
                },
                borderColor: Styles.bgColor,
                color: Styles.greenButton,
                height: 50,
                width: AppLayout.getScreenWidth() * 0.9,
                text: Text(
                  'Edit',
                  style: Styles.headLineStyleWhite3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
