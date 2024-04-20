import 'package:bmiapp/core/theming/colors.dart';
import 'package:bmiapp/core/theming/styles.dart';
import 'package:bmiapp/core/widgets/customButton.dart';
import 'package:bmiapp/features/HomeScreen/widgets/customrow.dart';
import 'package:bmiapp/features/HomeScreen/widgets/slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
class HomeScreenView extends StatelessWidget {
  var state=false.obs;
 late  double bmiresult;
  var sliderresult=40.0.obs;
  var numbers=<int>[
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70
  ];
  var weightselected=0.obs;
  var numberofaddorremove=1.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: Text("BMi Calculator",style: Styles.Montserratw500,),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.h,
              ),
            ),
           SliverToBoxAdapter(
             child: Center(child: Text("Gender",style: Styles.Montserratw500.copyWith(
               fontWeight: FontWeight.bold,
             ),)),
           ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 5.h,
              ),
            ),
           SliverToBoxAdapter(
               child:
               CustomRow(
                state: state,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 15.h,
              ),
            ),
            SliverToBoxAdapter(
              child:

             Align(alignment: Alignment.center,child: Text("Height",style: Styles.Montserratw500.copyWith( fontWeight: FontWeight.bold),))
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 30.h,
              ),
            ),
            SliverToBoxAdapter(
              child:
                CustomSlider(
                  result: sliderresult,
                    onchanged: (p0) {
                    sliderresult.value=p0;
                    },
                )
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 50.h,
              ),
            ),
            SliverToBoxAdapter(
                child:
             AgeOrWeight(
               ontapremove: () {
                 if(numberofaddorremove.value>1)
                 numberofaddorremove.value--;
               },
               ontapadd: () {
                 numberofaddorremove.value++;
               },
               addorremove: numberofaddorremove,
               numbers: numbers,
               selected: (p0) {
                 weightselected.value=numbers[p0];

               },
             )
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 50.h,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomButtonCore(
                text: 'go',
                ontouch: () async{
bmiresult=weightselected.value/(sliderresult.value.toInt()*sliderresult.value.toInt());
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" you are ${determineWeight(bmiresult)}",style: Styles.Montserratw500.copyWith(
  fontSize: 15.sp,
  fontWeight: FontWeight.w800
)),backgroundColor: AppColors.main,));

                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AgeOrWeight extends StatelessWidget{
  List<int>numbers;
  void Function(int)selected;
  void Function() ontapadd;
  void Function() ontapremove;
  Rx<int>addorremove;
  AgeOrWeight({
    required this.ontapremove,
    required this.ontapadd,
    required this.numbers,
    required this.selected,
    required this.addorremove
});
  @override
  Widget build(BuildContext context) {
  return Row( 
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [ 
      Column( 
        children: [ 
          Text("Age",style: Styles.Montserratw500.copyWith( fontWeight: FontWeight.bold,fontSize: 16.sp),),
          SizedBox( 
            height: 10.h,
          ),
          Container( 
            height: 60.h,
            width: 120.w,
            decoration: BoxDecoration( 
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: Colors.black
              )
            ),
            child: ChildOfAgeOrWeight(
              ontapadd: ontapadd,
              ontapremove: ontapremove,
              mynumber: addorremove,
            ),
          )
        ],
      ),
      Column(

        children: [
          Text("Weight",style: Styles.Montserratw500.copyWith( fontWeight: FontWeight.bold,fontSize: 16.sp),),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 60.h,
            width: 120.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                    color: Colors.black
                )
            ),
            child:
          ListWheelScrollView
        .useDelegate(
            useMagnifier: true,
    itemExtent: 42,
    childDelegate: ListWheelChildBuilderDelegate(
            builder: (context, index) =>Text(numbers[index].toString(),style: Styles.Montserratw500.copyWith(
              fontSize: 10.sp,
              fontWeight: FontWeight.bold
            ),) ,
            childCount: numbers.length
          ),onSelectedItemChanged: selected
          )
          )],
      ),
    ],
  );
  } 
  
} 



class ChildOfAgeOrWeight extends StatelessWidget{
  Rx<int>mynumber;
  void Function() ontapremove;
  void Function() ontapadd;
  ChildOfAgeOrWeight({
   required this.mynumber ,
    required this.ontapadd,
    required this.ontapremove
});
  @override
  Widget build(BuildContext context) {
return Padding(padding: EdgeInsets.all(5),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
     GestureDetector(
       onTap:ontapremove ,
       child: Container(
         height: 20.h,
         width: 20.w,
         decoration: BoxDecoration(
           border: Border.all(color: AppColors.main),
           borderRadius: BorderRadius.circular(30.r),
         ),
         child: Icon(Icons.remove,size: 15.sp,),
       ),
     ),
      Obx(() =>  Text(mynumber.toString())),
      GestureDetector  (
        onTap: ontapadd,
        child: Container(
          height: 20.h,
          width: 20.w,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.main),
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Icon(Icons.add,size: 15.sp,),
        ),
      ),
    ],
  ),
);
  }
}
String determineWeight(double result){
  var weight="";
  if(result<18.5)
    weight="UnderWeight";

  else if(18.5<=result&&result<25)
    weight="Normalweight";
  else if(25<=result&&result<30)
    weight="Overweight";
  else{
    weight="Obese";
  }
  return weight;
}