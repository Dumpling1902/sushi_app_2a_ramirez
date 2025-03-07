import 'package:flutter/material.dart';
import 'package:sushi_app_2a_ramirez/components/button.dart';
import 'package:sushi_app_2a_ramirez/theme/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
          ),
          title: Text(
            'Tokyo',
             style: TextStyle(color: Colors.grey[900]),),
        ),
      body: Column(
        children: [
        //promo banner
        Container(
          decoration: BoxDecoration(
            color: primaryColor, 
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          padding: EdgeInsets.all(25),
          child: Row(children: [

            Column(
              children: [
                //promo message
                Text('Get 32% Promo'),

                //redeem button 
                MyButton(text: 'Redeem', onTap: () {},
                ),
              ],
            )
          
          ],),
        )

        //search bar

        //menu list

        //popular food

      ],),
    );
  }
}