
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  const MyButton({Key? key,required this.onTap}) : super(key: key);
final Function() onTap;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return  GestureDetector(
     child: const Icon(
       Icons.search,
       color: Colors.white,
     ),
     onTap:onTap,
   );
  }

}