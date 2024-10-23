import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petetco/commons/models/petlist_model.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/commons/widget/custom_btn.dart';
import 'package:petetco/commons/widget/loading_dialog.dart';
import 'package:petetco/features/pet/controllers/pet_provider.dart';
import 'package:petetco/features/pet/widgets/petcard.dart';

class ListPetScreen extends ConsumerStatefulWidget {
  const ListPetScreen({super.key});

  @override
  ConsumerState<ListPetScreen> createState() => _ListPetScreenState();
}

class _ListPetScreenState extends ConsumerState<ListPetScreen> with TickerProviderStateMixin {
bool isLoading = true; 
PetList? petListInfo;


@override
  void initState() {
    super.initState();
    _checkStatus();
  }


 Future<void> _checkStatus() async {
    // Fetch user info asynchronously
    final petList = await ref.read(petStateProvider.notifier).getAllPet();
    // Update state when data is fetched
    setState(() {
      
      petListInfo = petList;
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    AppLayout.getSize(context);
    // Show a loading screen until data is fetched
    if (isLoading) {
      return const LoadingDialog();
    }
    return Stack(
      children:[
      
      Container(
        color: Styles.bgColor,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top:30,left: 10,right: 10),
              child:Column(
                children: petListInfo!.data!.map((pet) => PetCard( 
                  e: pet,
                  cardWidth: 450,
                  padding: EdgeInsets.only(bottom: 15),
                  )
                   ).toList(),) 
                ) ,
              
          ],
        ),
      ),
      
      
      
      Container(
         
        color: Colors.yellow,
        child: CustomButton(width: 100, height: 50, borderColor: Colors.red, text: Text("data"))
        ),
    
    ]);
  }
}