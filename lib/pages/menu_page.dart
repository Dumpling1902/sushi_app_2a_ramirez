import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app_2a_ramirez/components/button.dart';
import 'package:sushi_app_2a_ramirez/models/shop.dart';
import 'package:sushi_app_2a_ramirez/theme/colors.dart';

import '../components/food_tile.dart';
import 'food_details_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //navigate to food item details page
  void navigateToFoodDetails(int index) {

    //get the shop and it's menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailsPage(
      food: foodMenu[index],
    ),),);
  }


  @override
  Widget build(BuildContext context) {
        //get the shop and it's menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        leading: Icon(
          Icons.menu,
          ),
          title: Text(
            'Tokyo',
          ),
          actions: [
            //cart button
            IconButton(onPressed:() {
              Navigator.pushNamed(context, '/cartpage');
            }, 
            icon: Icon(Icons.shopping_cart),)
          ],
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        //promo banner
        Container(
          decoration: BoxDecoration(
            color: primaryColor, 
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //promo message
               Text(
                'Get 32% Promo', 
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 20,
                  color: Colors.white,
                ),),

                const SizedBox(height: 20),

                //redeem button 
                MyButton(text: 'Redeem', onTap: () {},
                ),
              ],
            ),

            //image
            Image.asset(
              'lib/images/many_sushi.png', 
              height: 100,
              ),
          
          ],),
        ),

        const SizedBox(height: 25),

        //search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "Search here..",
              ),

            ),
          ),

          const SizedBox(height: 25),
        

        //menu list
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0 ),
          child: Text(
            "Food Menu", 
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              color: Colors.grey[800],
              fontSize: 18,
            ),
          ),
        ),

        const SizedBox(height: 10),

        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodMenu.length,
            itemBuilder: (context, index) => FoodTile(
              food: foodMenu[index],
              onTap: () => navigateToFoodDetails(index),
            ),
          ),
        ),

        const SizedBox(height: 25),


        //popular food
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Row(children: [
              //image
            Image.asset('lib/images/salmon_eggs.png', height: 60,),

            const SizedBox(width: 20),

            //name and price
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              //name
              Text("Salmon Eggs", style: GoogleFonts.dmSerifDisplay(fontSize: 18),),

              const SizedBox(height: 10),

              //price
              Text('\$21.00', style: TextStyle(color: Colors.grey[700]),),
            ],
            ),
            ],),

            //heart
            Icon(Icons.favorite_outline, color: Colors.grey, size: 28),

          ],),
        ),

      ],),
    );
  }
}