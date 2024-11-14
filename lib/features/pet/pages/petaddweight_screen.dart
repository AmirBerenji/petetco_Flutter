import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:gap/gap.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/commons/widget/custom_btn.dart';
import 'package:petetco/commons/widget/custome_textfield.dart';
import 'package:petetco/commons/widget/head_list.dart';

class PetAddWeightScreen extends StatefulWidget {
  const PetAddWeightScreen({super.key});

  @override
  State<PetAddWeightScreen> createState() => _PetAddWeightScreenState();
}

class _PetAddWeightScreenState extends State<PetAddWeightScreen> {
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _weight = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        title: Text('Add Weight'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              children: [
                Gap(10),
                CustomTextField(
                  hintText: "Date of weight",
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime.now()
                            .add(const Duration(days: -(365 * 30))),
                        maxTime: DateTime.now(),
                        onChanged: (date) {}, onConfirm: (date) {
                      _dob.text = date.toString().substring(0, 10);
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  controller: _dob,
                  hintStyle: TextStyle(color: Styles.grey600),
                  keyboardType: TextInputType.none,
                  textInputAction: TextInputAction.next,
                ),
                Gap(20),
                CustomTextField(
                  hintText: 'Weight',
                  controller: _weight,
                  keyboardType: TextInputType.number,
                ),
                Gap(20),
                CustomButton(
                    width: 380,
                    height: 50,
                    borderColor: Styles.grey200,
                    color: Styles.greenButton,
                    text: Text(
                      'Save',
                      style: Styles.headLineStyleWhite3,
                    )
                    ),
                    Gap(20),
                    Divider(),
                    HeadList(listText: 'History'),
                    Gap(20),
              ],
            )
          ],
        ),
      ),
    );
  }
}
