import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petetco/commons/models/petlist_model.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/commons/widget/loading_dialog.dart';
import 'package:petetco/features/pet/controllers/pet_provider.dart';
import 'package:petetco/features/pet/pages/addpet_screen.dart';
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
      alignment: Alignment.bottomRight,

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
      
      
      Padding(
        padding:  EdgeInsets.all(10.0),
        child:  GestureDetector(
          onTap: (){

             Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context) => const AddPetScreen()
                              )
                            );
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Styles.green900,
              borderRadius: BorderRadius.all(Radius.circular(50))
            ),
            child: Icon(Icons.add,color: Styles.grey100,),
          ),)
      ),
         
        
    
    ]);
  }
}