import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petetco/commons/dto/petAddWeight_dto.dart';
import 'package:petetco/commons/models/petWeight_model.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/commons/widget/custom_btn.dart';
import 'package:petetco/commons/widget/custome_dialog.dart';
import 'package:petetco/commons/widget/custome_textfield.dart';
import 'package:petetco/commons/widget/head_list.dart';
import 'package:petetco/commons/widget/loading_dialog.dart';
import 'package:petetco/features/pet/controllers/pet_provider.dart';

class PetAddWeightScreen extends ConsumerStatefulWidget {
  const PetAddWeightScreen({super.key, required this.petId});
  final int petId;

  @override
  ConsumerState<PetAddWeightScreen> createState() => _PetAddWeightScreenState();
}

class _PetAddWeightScreenState extends ConsumerState<PetAddWeightScreen> {
  final TextEditingController _date = TextEditingController();
  final TextEditingController _weight = TextEditingController();

bool isLoading = true;
List<PetWeight> petweight = [];

@override
  void initState() {
    super.initState();
    _checkStatus();
  }


Future<void> _checkStatus() async {
    // Fetch user info asynchronously
    Map<String, dynamic> data = {"pet_id": widget.petId};
    final listPetWeight =  await ref.read(petStateProvider.notifier).getAllPetWeight(data);
    // Update state when data is fetched
    setState(() {
      petweight = listPetWeight;
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    AppLayout.getSize(context);
  if (isLoading) {
      return const LoadingDialog();
    }
  
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
                      _date.text = date.toString().substring(0, 10);
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  controller: _date,
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
                    onTap: () async {
                      if (_date.text == "" || _date.text == null) {
                        CustomAwesomeDialog(
                            context, "Please select date", DialogType.error).show();
                        return;
                      } else if (_weight.text == "" ||
                          _weight.text == null ||
                          _weight.text == "0") {
                        CustomAwesomeDialog(context, "Please write the weight",
                            DialogType.error).show();
                        return;
                      }

                      var model = PetWeightAddDto(
                          petId: widget.petId,
                          date: _date.text,
                          weight: double.parse(_weight.text));
                      await ref
                          .read(petStateProvider.notifier)
                          .addweight(model);
                    },
                    width: AppLayout.getScreenHeight() * 0.9,
                    height: AppLayout.getHeight(50),
                    borderColor: Styles.grey200,
                    color: Styles.greenButton,
                    text: Text(
                      'Save',
                      style: Styles.headLineStyleWhite3,
                    )),
                Gap(AppLayout.getHeight(20)),
                Divider(),
                HeadList(listText: 'History'),
                Gap(AppLayout.getHeight(5)),
                Column(
                  children: petweight.map((e) => Row(
                    children: [
                      Gap(20),
                      Text(e.date.toString().substring(0,11) +": "),
                      Gap(5),
                      Text(e.weight.toString())
                    ],
                  )).toList(),
                )
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
